import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sakeny/Data/Model/UserModel.dart';
import 'package:sakeny/Data/Repo/HomeRepo.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit(this.homeRepo) : super(UserDataInitial());

  static UserDataCubit get(context) => BlocProvider.of(context);
  HomeRepo homeRepo;

  Future<void> getUserData() async
  {
    emit(LoadingUserData());
    try {
      var data = await homeRepo.getUserDat();
      debugPrint("userData${data}");
      emit(SuccessUserData(userModel: data));
    } catch (e) {
      emit(ErrorUserModel(error: e.toString()));
    }
  }

  TextEditingController userInfo = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();
  TextEditingController userAddressController = TextEditingController();

  upDateUserData({
    required String userInfo,
    required String userName,
    required String userEmail,
    required String userPhone,
    required String userAddress,
  }) async {
    try {
      homeRepo.upDataUserData(userInfo: userInfo,
          userName: userName,
          userEmail: userEmail,
          userPhone: userPhone,
          userAddress: userAddress);
      await getUserData();
      emit(SuccessUpDateUser());

    } catch (e) {
   emit(ErrorUpdateUser(error: e.toString()));

    }
  }
}
