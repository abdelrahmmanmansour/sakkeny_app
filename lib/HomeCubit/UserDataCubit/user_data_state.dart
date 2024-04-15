part of 'user_data_cubit.dart';

@immutable
sealed class UserDataState {}

final class UserDataInitial extends UserDataState {}

final class LoadingUserData extends UserDataState {}

final class SuccessUserData extends UserDataState {
  final UserModel userModel;

  SuccessUserData({required this.userModel});
}

final class ErrorUserModel extends UserDataState {
  final String error;

  ErrorUserModel({required this.error});
}

final class LoadingUpDateUser extends UserDataState {}

final class SuccessUpDateUser extends UserDataState {}

final class ErrorUpdateUser extends UserDataState {
  final String error;

  ErrorUpdateUser({required this.error});
}
