
abstract class UploadDataState {}

class UploadDataInitial extends UploadDataState {}
class SuccessUpload extends UploadDataState {}
class SuccessChange extends UploadDataState {}
class SuccessChanged extends UploadDataState {}
class ErrorUpload extends UploadDataState {
  final String error;

  ErrorUpload({required this.error});
}
