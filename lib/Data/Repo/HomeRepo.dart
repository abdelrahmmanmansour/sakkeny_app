import 'package:sakeny/CustomTextCubit/model.dart';
import 'package:sakeny/Data/Model/UserModel.dart';

abstract class HomeRepo{
Future<Map<String,dynamic>> signIn({
    required String userName,
    required String userPassword,
    required String userFullName,
    required String  userEmail,
    required String userNatId,
    required String userGender,
    required String userAge,
    required String userInfo,
    required String userAddress,
    required String userAccountType,

});

Future<Map<String,dynamic>>upDataUserData({
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
});
Future<Map<String,dynamic>>logIn({
    required String userMail,
    required String password,
});
Future<UserModel>getUserDat();
}