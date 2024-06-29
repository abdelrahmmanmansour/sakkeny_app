part of 'get_post_cubit.dart';

@immutable
abstract class GetPostState {}

class GetPostInitial extends GetPostState {}
class LoadingGetUserSuggest extends GetPostState {}
class LoadingDelete extends GetPostState {}
class SuccessGetUserDataSuggest extends GetPostState {}
class LoadingFavorite extends GetPostState {}
class LoadingGetFavorite extends GetPostState {}
class SuccessGetFavorite extends GetPostState {}
class SuuccessAddFavorite extends GetPostState {}
class SuccessDelete extends GetPostState {}
class ErrorGetPostSuggest extends GetPostState {
  ErrorGetPostSuggest({required this.error});
  final String error;
}
class ErrorDeleteFavorite extends GetPostState {
  ErrorDeleteFavorite({required this.error});
  final String error;
}
class ErrorGetFavorite extends GetPostState {
  ErrorGetFavorite({required this.error});
  final String error;
}
// class LoadingUpDatePost extends GetPostState {}
class SuccessSearch extends GetPostState {}
class ErrorSearch extends GetPostState {
  ErrorSearch({required this.error});
  final String error;
}
class ErrorFavorite extends GetPostState {
  ErrorFavorite({required this.error});
  final String error;
}