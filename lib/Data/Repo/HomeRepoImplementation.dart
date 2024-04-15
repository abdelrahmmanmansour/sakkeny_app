import 'package:sakeny/Core/Constant/Constant.dart';
import 'package:sakeny/Core/Services/ApiServices.dart';
import 'package:sakeny/Data/Model/UserModel.dart';
import 'package:sakeny/Data/Repo/HomeRepo.dart';
import 'package:sakeny/costant.dart';

class HomeRepoImplementation extends HomeRepo {
  HomeRepoImplementation({required this.apiServices});

  ApiServices apiServices;

  @override
  Future<Map<String, dynamic>> signIn(
      {required String userName,
      required String userPassword,
      required String userFullName,
      required String userEmail,
      required String userNatId,
      required String userGender,
      required String userInfo,
      required String userAge,
      required String userAddress,
      required String userAccountType}) async {
    var data = await apiServices.postApi({
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
    }, "users");
    return data;
  }

  @override
  Future<Map<String, dynamic>> logIn(
      {required String userMail, required String password}) async {
    var data = await apiServices.postApi({
      "userMail": userMail,
      "password": password,
    }, "authentication/login");
    return data;
  }

  @override
  Future<UserModel> getUserDat() async {
    var data = await apiServices.getApi();
    print("$data");
    UserModel userModel;
    userModel = UserModel.fromJson(data);
    print("$userModel");

    return userModel;
  }

  @override
  Future<Map<String, dynamic>> upDataUserData(
      {required String userInfo,
      required String userName,
      required String userEmail,
      required String userPhone,
      required String userAddress}) async {
    var data = await apiServices.putApi({
      "userInfo": userInfo,
      "userName": userName,
      "userAddress": userAddress,
      "userEmail": userEmail,
      "userNatId": userPhone,
    }, "users");
    return data;
  }
}
