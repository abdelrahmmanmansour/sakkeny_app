part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}
class LoadingGetUserChat extends ChatState {}
class SuccessGetUserChat extends ChatState {}
class ErrorGetUserChat extends ChatState {}
class LoadingPostChat extends ChatState {}
class SuccessPostChat extends ChatState {}
class ErrorPostChat extends ChatState {
  final String error;

  ErrorPostChat({required this.error});
}
class LoadingGetChat extends ChatState {}
class SuccessGetChat extends ChatState {}
class ErrorGetChat extends ChatState {
  final String error;

  ErrorGetChat({required this.error});
}