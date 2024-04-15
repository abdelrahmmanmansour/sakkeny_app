import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:sakeny/Core/Constant/Constant.dart';
import 'package:sakeny/Core/Services/CachedHelper.dart';
import 'package:sakeny/CustomTextCubit/model.dart';
import 'package:sakeny/Data/Repo/HomeRepo.dart';
import 'package:http/http.dart' as http;

part 'custom_text_state.dart';

class CustomTextCubit extends Cubit<CustomTextState> {
  CustomTextCubit() : super(CustomTextInitial());

  void getData({
    required String userName,
    required String userPassword,
    required String userFullName,
    required String userEmail,
    required String userNatId,
    required String userGender,
    required String userAge,
    required String userInfo,
    required String userAddress,
    required String userAccountType,
  }) async {
    emit(LoadingCustom());
    try {
      final Map<String, dynamic> requestBody = {
        "userName": userName,
        "userPassword": userPassword,
        "userFullName": userFullName,
        "userEmail": userEmail,
        "userNatId": userNatId,
        "userGender": userGender,
        "userAge": userAge,
        "userInfo": userInfo,
        "userAddress": userAddress,
        "userAccountType": userAccountType
      };

      final http.Response response = await http.post(
        Uri.parse("http://sakenyapi.runasp.net/api/users"),
        headers: {
          "Content-Type": "application/json"
        },
        body: jsonEncode(requestBody), // Convert the body to JSON string
      );

      final responseBody = jsonDecode(response.body);
      debugPrint("the response is $responseBody");
      emit(SuccessCustomText());
    } catch (e) {
      emit(ErrorCustomText(error: e.toString()));
      print("the error is ${e.toString()}");
    }
  }

  GlobalKey<FormState> formKeyRegister=GlobalKey();

  TextEditingController userNameController=TextEditingController();
  TextEditingController userIdController=TextEditingController();
  TextEditingController userEmailController=TextEditingController();
  TextEditingController userPassWord=TextEditingController();
  TextEditingController userAddressController=TextEditingController();
  TextEditingController userAgeController=TextEditingController();
  TextEditingController userInfo=TextEditingController();
  TextEditingController userFullName=TextEditingController();
  String male="ذكر";
  String female="أنثى";
  String kind1="مستأجر";
  String kind2="مالك";
  int ?index;
  bool isKind=true;
  void kind(){
    isKind=!isKind;
    emit(ChangeSuccess());
  }
}
