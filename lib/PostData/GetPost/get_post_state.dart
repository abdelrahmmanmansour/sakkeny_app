part of 'get_post_cubit.dart';

@immutable
abstract class GetPostState {}

class GetPostInitial extends GetPostState {}
class SuccessGetUserData extends GetPostState {}
class ErrorGetPost extends GetPostState {
  ErrorGetPost({required this.error});
  final String error;
}
