
abstract class UploadDataState {}

class UploadDataInitial extends UploadDataState {}
class SuccessUpload extends UploadDataState {}
class SuccessChange extends UploadDataState {}
class SuccessChanged extends UploadDataState {}
class SuccessUpDatePost extends UploadDataState {}
class LoadingUpDatePost extends UploadDataState {}
class SuccessGetLocation extends UploadDataState {}
class LoadingGetUser extends UploadDataState {}
class SuccessGetUserData extends UploadDataState {}
class LoadingUploadPost extends UploadDataState {}
class BenefitsUpdatedState extends UploadDataState {}
class ErrorGetLocation extends UploadDataState {
  final String error;

  ErrorGetLocation({required this.error});
}
class ErrorUpload extends UploadDataState {
  final String error;

  ErrorUpload({required this.error});
}
class ErrorUpDatePost extends UploadDataState {
  final String error;

  ErrorUpDatePost({required this.error});
}
class ErrorGetPost extends UploadDataState {
  final String error;

  ErrorGetPost({required this.error});
}
class SuccessDeletePost extends UploadDataState {}
class ErrorDeletePost extends UploadDataState {
  final String error;

  ErrorDeletePost({required this.error});
}
class LoadingGetSuggestAi extends UploadDataState {}
class SuccessGetSuggestAi extends UploadDataState {}
class ErrorGetSuggestAi extends UploadDataState {
  final String error;

  ErrorGetSuggestAi({required this.error});
}