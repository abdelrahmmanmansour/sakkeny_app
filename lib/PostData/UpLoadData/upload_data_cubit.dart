import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakeny/PostData/UpLoadData/upload_data_state.dart';
import 'package:sakeny/checkbox_state/checkbox_state.dart';
import 'package:http/http.dart'as http;
class TestCubit extends Cubit<UploadDataState> {
  TestCubit() : super(UploadDataInitial());

  static TestCubit get(context) => BlocProvider.of(context);

  TextEditingController PostArea = TextEditingController();
  TextEditingController PostKitchens = TextEditingController();
  TextEditingController PostBedrooms = TextEditingController();
  TextEditingController PostPetsAllow = TextEditingController();

  TextEditingController PostBathrooms = TextEditingController();
  String yes = "نعم";
  String no = "لا";
  bool istrue = true;

  void change() {
    istrue = !istrue;
    emit(SuccessChanged());
  }
  final benefits = [
    CheckBoxState(title: 'اجهزة مطبخ مدمجة'),
    CheckBoxState(title: 'مصعد'),
    CheckBoxState(title: 'شرفة او تراس'),
    CheckBoxState(title: 'خدمة wifi'),
    CheckBoxState(title: 'عداد مياه'),
    CheckBoxState(title: 'غاز طبيعي'),
    CheckBoxState(title: 'خط ارضي'),
    CheckBoxState(title: 'عداد كهرباء'),

  ];
  bool isCheck=true;
  postData(
      List<String> imagePaths,
      List<CheckBoxState> hi1,
      int PostArea,
      int PostKitchens,
      int PostBedrooms,
      bool PostLookSea,
      int PostBathrooms,
      String  PostCategory

      ) async {
    try {
      List<Map<String, String>> picturesTable = [];
      List<Map<String, String>> postPicTbls1 = [];

      for (String path in imagePaths) {

        picturesTable.add({"pictureString": path});
      }

      for (CheckBoxState path in hi1) {
        postPicTbls1.add({"FeaturesName": "${path.title+path.value.toString()}"});

      }

      http.Response response = await http.post(
        Uri.parse("http://sakenyapi.runasp.net/api/Posts"),
        body:
        jsonEncode( {

          "PostDate": "2022-01-01",
          "postId":"1",
          "PostTime": "12:00:00",
          "PostCategory":PostCategory ,
          "PostTitle": "Title1",
          "PostBody": "Body1",
          "PostArea": PostArea,
          "PostKitchens": PostKitchens,
          "PostBedrooms": PostBathrooms,
          "PostBathrooms": PostBathrooms,
          "PostLookSea": PostLookSea,
          "PostPetsAllow": true,
          "PostCurrency": "USD",
          "PostPriceAi": "1000",
          "PostPriceDisplay":" 10000.0",
          "PostPriceType": "Rent",
          "PostAddress": "Address1",
          "PostCity": "City1",
          "PostState": "State1",
          "PostFloor": 1,
          "PostLatitude": "40.712776",
          "PostLongitude": -74.005974,
          "PostStatue": "true",
          "PostUserId": 10,
          "PostPicTbls": picturesTable,
          "Features": postPicTbls1
        }),

        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        var responsebod = jsonDecode(response.body);
        print("hello${responsebod}");
        emit(SuccessUpload());
      } else {
        print("HTTP Error: ${response.statusCode}");
        emit(ErrorUpload(error: "HTTP Error: ${response.statusCode}"));
      }
    } catch (e) {
      print("the error is $e");
      emit(ErrorUpload(error: e.toString()));
    }
  }


  List<String> images = [];
  ImagePicker imagePicker = ImagePicker();

  void getImageAsString() async {
    final pickedFiles = await imagePicker.pickMultiImage(

    );

    if (pickedFiles != null) {
      for (var pickedFile in pickedFiles) {
        List<int> imageBytes = await pickedFile.readAsBytes();

        String base64Image = base64Encode(imageBytes);

        images.add(base64Image);
      }
      emit(SuccessChange());
    }
  }

}