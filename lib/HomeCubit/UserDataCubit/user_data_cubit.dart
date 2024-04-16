import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sakeny/Core/Constant/Constant.dart';
import 'package:sakeny/Data/Model/UserModel.dart';
import 'package:sakeny/Data/Repo/HomeRepo.dart';
import 'package:http/http.dart' as http;

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit(this.homeRepo) : super(UserDataInitial());

  static UserDataCubit get(context) => BlocProvider.of(context);
  HomeRepo homeRepo;
  UserModel? userModel;

  Future<void> getUserData() async {
    emit(LoadingUserData());
    try {
      var data = await homeRepo.getUserDat();
      userModel = data;
      debugPrint("userData${data}");
      emit(SuccessUserData());
    } catch (e) {
      emit(ErrorUserModel(error: e.toString()));
    }
  }

  TextEditingController userInfo = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();
  TextEditingController userAddressController = TextEditingController();

  Future<void> upDateUserData({
    required String userInfo,
    required String userName,
    required String userEmail,
    required String userPhone,
    required String userAddress,
    required String userPassword,
    required String userFullName,
    required String userGender,
    required String userAccountType,
    required String userAge,
  }) async {
    String url = "http://sakenyapi.runasp.net/api/users";
    try {
      var response = await http.put(
        Uri.parse("http://sakenyapi.runasp.net/api/users"),
        body: jsonEncode(
          {
            "userId": 28.0, // Ensure your data is JSON encoded
            "userName": userName,
            "userPassword": userPassword,
            "userFullName": userFullName,
            "userEmail": userEmail,
            "userNatId": userPhone,
            "userGender": userGender,
            "userAge": userAge,
            "userInfo": userInfo,
            "userAddress": userAddress,
            "userAccountType": userAccountType,
          },
        ),
        headers: {
          "Authorization": "Bearer ${Constant.token}",
          "Content-Type": "application/json"
        },
      );

      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      jsonDecode(response.body);
      if (response.statusCode == 200) {
        await getUserData();
        emit(SuccessUpDateUser());
      } else {
        var error =
            'Failed to update user data: ${response.statusCode} - ${response.reasonPhrase}';
        print(error);
        emit(ErrorUpdateUser(error: error));
      }
    } catch (e) {
      print('Exception caught: $e');
      emit(ErrorUpdateUser(error: e.toString()));
    }
  }
}
