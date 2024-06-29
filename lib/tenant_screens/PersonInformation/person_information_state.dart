part of 'person_information_cubit.dart';

@immutable
abstract class PersonInformationState {}

class PersonInformationInitial extends PersonInformationState {}
class LoadingGetMessage extends PersonInformationState {}
class SuccessGetMessage extends PersonInformationState {}
class LoadingPostMessage extends PersonInformationState {}
class SuccessPostMessage extends PersonInformationState {}
class ErrorGetMessage extends PersonInformationState {
  final String error;

  ErrorGetMessage({required this.error});
}
class ErrorPostMessage extends PersonInformationState {
  final String error;

  ErrorPostMessage({required this.error});
}
