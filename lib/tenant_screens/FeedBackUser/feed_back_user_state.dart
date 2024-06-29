part of 'feed_back_user_cubit.dart';

@immutable
abstract class FeedBackUserState {}

class FeedBackUserInitial extends FeedBackUserState {}
class SuccessPostFeedBackUser extends FeedBackUserState {}
class ErrorPostFeedBackUser extends FeedBackUserState {
  final String error;

  ErrorPostFeedBackUser({required this.error});
}
class SuccessGetFeedBackUser extends FeedBackUserState {}
class ErrorGetFeedBackUser extends FeedBackUserState {
  final String error;

  ErrorGetFeedBackUser({required this.error});
}