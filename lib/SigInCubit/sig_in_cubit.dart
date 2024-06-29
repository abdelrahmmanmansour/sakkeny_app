import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sakeny/Core/Services/CachedHelper.dart';
import 'package:sakeny/Data/Repo/HomeRepo.dart';

part 'sig_in_state.dart';

class SigInCubit extends Cubit<SigInState> {
  SigInCubit(this.homeRepo) : super(SigInInitial());

  static SigInCubit get(context) => BlocProvider.of(context);
  HomeRepo homeRepo;
  GlobalKey<FormState> formKeyRegister = GlobalKey();
  GlobalKey<FormState> formKeyLogIn0 = GlobalKey();

  TextEditingController userNameController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPassWord = TextEditingController();
  TextEditingController userAddressController = TextEditingController();
  TextEditingController userAgeController = TextEditingController();
  TextEditingController userInfo = TextEditingController();
  TextEditingController userFullName = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String male = "ذكر";
  String female = "أنثى";
  String kind1 = "مستأجر";
  String kind2 = "مالك";
  int? index;

  sigIn({
    required String userName,
    required String userPassword,
    required String userFullName,
    required int userAge,
    required String userEmail,
    required String userNatId,
    required String userGender,
    required String userInfo,
    required String userAddress,
    required String userAccountType,
  }) async {
    emit(LoadingSignIn());
    try {
      var data = await homeRepo.signIn(
          userName: userName,
          userPassword: userPassword,
          userFullName: userFullName,
          userAge: userAge,
          userEmail: userEmail,
          userNatId: userNatId,
          userGender: userGender,
          userInfo: userInfo,
          userAddress: userAddress,
          userAccountType: userAccountType);
      debugPrint("the data succes is${data}");

      emit(SuccessSignIn());
      debugPrint("the data succes is${data}");
    } catch (e) {
      emit(ErrorSignIn(error: e.toString()));
      debugPrint("the error is ${e.toString()}");
    }
  }

 void logIn({
    required String userMail,
    required String password,
  }) async {
    emit(LoadingLogIn());
    try {
      var dataLogIn = await homeRepo.logIn(
        userMail: userMail,
        password: password,
      );
    if(dataLogIn.statusCode==200){
      var responseBody=jsonDecode(dataLogIn.body);
      debugPrint("the data succes is${dataLogIn}");
      await CacheHelper.saveData(key: "reId", value: responseBody["id"]);
      await CacheHelper.saveData(key: "userAccountType", value: responseBody["userAccountType"]);
      await CacheHelper.saveData(
          key: "retToken", value: responseBody["tokenToReturn"]);

      emit(SuccessLogIn());
      debugPrint("the data succes is${dataLogIn}");
      debugPrint("the data succes is${CacheHelper.getData(key: "userAccountType")}");
    }
    else{
      emit(ErrorLogIn(error: "خطأ فى تسجيل الدخول"));
    }
    } catch (e) {
      emit(ErrorLogIn(error: e.toString()));
      debugPrint("the error is ${e.toString()}");
    }
  }

  bool isKind = true;

  void kind() {
    isKind = !isKind;
    emit(ChangeSuccess());
  }
}
