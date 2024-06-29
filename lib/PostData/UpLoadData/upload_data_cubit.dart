import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakeny/Core/Services/CachedHelper.dart';
import 'package:sakeny/Data/Model/GetPostDataUser.dart';
import 'package:sakeny/PostData/UpLoadData/upload_data_state.dart';
import 'package:sakeny/checkbox_state/checkbox_state.dart';
import 'package:http/http.dart' as http;
class TestCubit extends Cubit<UploadDataState> {
  TestCubit() : super(UploadDataInitial());
  static TestCubit get(context) => BlocProvider.of(context);
  TextEditingController PostArea = TextEditingController();
  TextEditingController PostKitchens = TextEditingController();
  TextEditingController PostBedrooms = TextEditingController();
  TextEditingController PostPetsAllow = TextEditingController();
  TextEditingController selectCity = TextEditingController();
  TextEditingController selectRegion = TextEditingController();
  TextEditingController suggestUser = TextEditingController();
  TextEditingController PostBathrooms = TextEditingController();
  String yes = "نعم";
  String no = "لا";
  bool istrue = true;

  void change() {
    istrue = !istrue;
    emit(SuccessChanged());
  }
  List<CheckBoxState> selectedBenefits = [];

  void updateBenefits(List<CheckBoxState> benefits) {
    selectedBenefits = benefits;
    emit(BenefitsUpdatedState()); // Define a new state for benefits update
  }
  // final benefits = [
  //   CheckBoxState(title: 'اجهزة مطبخ مدمجة'),
  //   CheckBoxState(title: 'مصعد'),
  //   CheckBoxState(title: 'شرفة او تراس'),
  //   CheckBoxState(title: 'خدمة wifi'),
  //   CheckBoxState(title: 'عداد مياه'),
  //   CheckBoxState(title: 'غاز طبيعي'),
  //   CheckBoxState(title: 'خط ارضي'),
  //   CheckBoxState(title: 'عداد كهرباء'),
  // ];
  bool isCheck = true;
  void getSuggest({
    required String apartment,
    required String region,
    required String city,
   required int postArea,
    required int postKitchens,
  required  int postBedrooms,
    required int postBathrooms,    required bool furnished,
    required bool house_Type,
  }) async {
    emit(LoadingGetSuggestAi());
    try {
      // Prepare the request body as JSON
      var requestBody = jsonEncode({
        "Size":postArea,
        "Bedrooms": postBedrooms,
        "Bathrooms": postBathrooms,
        "Floor": postKitchens,
        "House_Type": "Apartment",
        "Furnished": furnished,
        "For_rent": house_Type,
        "Region": region,
        "City": city
      });

      // Make the HTTP POST request
      http.Response response = await http.post(
        Uri.parse("http://priceprediction.runasp.net/predict"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: requestBody,
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        print(responseBody);
        await CacheHelper.saveData(key: "price", value: responseBody["prdictedPrice"]);
        emit(SuccessGetSuggestAi());
      } else {
        emit(ErrorGetSuggestAi(error: 'Failed to get suggestion'));
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorGetSuggestAi(error: e.toString()));
    }
  }
 void postData(
    List<String> imagePaths,
    List<CheckBoxState> hi1,
    int PostArea,
    int PostKitchens,
    int PostBedrooms,
    bool PostLookSea,
    int PostBathrooms,
    String PostCategory,
    String latitude,
    String longitude,
    String price,
    String ai,
  ) async {
   getDataList.clear();

   emit(LoadingUploadPost());

    try {
      List<Map<String, String>> picturesTable = [];
      List<Map<String, String>> postPicTbls1 = [];

      for (String path in imagePaths) {
        picturesTable.add({"pictureString": path});
      }

      for (CheckBoxState path in hi1) {
        postPicTbls1
            .add({"FeaturesName": "${path.title + path.value.toString()}"});
      }

      http.Response response = await http.post(
        Uri.parse("http://sakenyapi.runasp.net/api/Posts"),
        body: jsonEncode({
          "PostDate": "2022-01-01",
          "PostTime": "12:00:00",
          "PostCategory": PostCategory,
          "PostTitle": "Title1",
          "PostBody": "Body1",
          "PostArea": PostArea,
          "PostKitchens": PostKitchens,
          "PostBedrooms": PostBathrooms,
          "PostBathrooms": PostBathrooms,
          "PostLookSea": PostLookSea,
          "PostPetsAllow": true,
          "PostCurrency": "USD",
          "PostPriceAi": ai,
          "PostPriceDisplay": price,
          "PostPriceType": "Rent",
          "PostAddress": "Address1",
          "PostCity": "City1",
          "PostState": "State1",
          "PostFloor": 1,
          "PostLatitude": latitude,
          "PostLongitude": longitude,
          "PostStatue": "true",
          "PostUserId": CacheHelper.getData(key: "reId"),
          "PostPicTbls": picturesTable,
          "Features": postPicTbls1
        }),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${CacheHelper.getData(key: "retToken")}",

        },
      );

      if (response.statusCode == 200) {
        var responsebod = jsonDecode(response.body);
        print("hello${responsebod}");
        await getDataPost(CacheHelper.getData(key: "reId"));
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
    final pickedFiles = await imagePicker.pickMultiImage();

    if (pickedFiles != null) {
      for (var pickedFile in pickedFiles) {
        List<int> imageBytes = await pickedFile.readAsBytes();

        String base64Image = base64Encode(imageBytes);

        images.add(base64Image);
      }
      emit(SuccessChange());
    }
  }

  List<GetPostDataUser> getDataList = [];

  Future<void> getDataPost(int id) async {

    emit(LoadingGetUser());


    try {
      http.Response response = await http
          .get(Uri.parse("http://sakenyapi.runasp.net/api/Posts/user/$id"),headers: {
        "Authorization": "Bearer ${CacheHelper.getData(key: "retToken")}",

      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        getDataList.clear();

        for (var item in responseBody) {
          getDataList.add(GetPostDataUser.fromJson(item));
        }
        print("the lenght is ${getDataList.length}");
        emit(SuccessGetUserData());
      }
    } catch (e) {
      emit(ErrorGetPost(error: e.toString()));
    }
  }

  void updatePost({
    required String postArea,
    required String postKitchen,
    required String postBedRooms,
    required String postBathRooms,
    required bool postLookSea,
    required String PostCategory,
    required int id,
    required List<String> images,
    required List<String> feature,
  }) async {
    // getDataList.clear();
    emit(LoadingUploadPost());
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${CacheHelper.getData(key: "retToken")}",

      };
      List<Map<String, String>> imagesList =
          images.map((image) => {"PictureString": image}).toList();
      List<Map<String, String>> featuresList =
      feature.map((feature) => {"FeaturesName": feature}).toList();
      http.Response response =
          await http.put(Uri.parse("http://sakenyapi.runasp.net/api/Posts/$id"),
              headers: headers, // Add headers to your request
              body: jsonEncode({
                "PostArea": postArea,
                "PostKitchens": postKitchen,
                "PostBedrooms": postBedRooms,
                "PostBathrooms": postBathRooms,
                "PostLookSea": postLookSea,
                "PostUserId": CacheHelper.getData(key: "reId"),
                "PostPicTbls": imagesList,
                "Features":  featuresList,
                "postPriceAi": 20000,
                "postPriceDisplay": 25000,
              }));
print("the response ${response.statusCode}");
      getDataList.clear();

      if (response.statusCode == 200) {
        await getDataPost(CacheHelper.getData(key: "reId"));
        emit(SuccessUpDatePost());
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorUpDatePost(error: e.toString()));
    }
  }

  Position? position; // Make position nullable

  String? late;
  String? lang;

  void getLocation() async {
    try {
      position = await _determinePosition();
      if (position != null) {
        late = position!.latitude.toString();
        lang = position!.longitude.toString();
        emit(SuccessGetLocation());
        print("Latitude: $late, Longitude: $lang");
      } else {
        print("Position is null");
        emit(ErrorGetLocation(error: "Position is null"));
      }
    } catch (e) {
      print("Error getting location: $e");
      emit(ErrorGetLocation(error: "Error getting location: $e"));
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  void deletePost(num idDelete) async {
    // getDataList.clear();
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${CacheHelper.getData(key: "retToken")}"
      };
      http.Response response = await http
          .delete(Uri.parse("http://sakenyapi.runasp.net/api/Posts/$idDelete"),
      headers: headers
      );
      print(response.statusCode);
      if(response.statusCode==204){
        print("success delete");
        await getDataPost(CacheHelper.getData(key: "reId"));
        emit(SuccessDeletePost());
      }


    } catch (e) {
      print(e.toString());
      emit(ErrorDeletePost(error: e.toString()));
    }
  }
}
