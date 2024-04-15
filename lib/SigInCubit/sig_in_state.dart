part of 'sig_in_cubit.dart';

@immutable
sealed class SigInState {}

final class SigInInitial extends SigInState {}
final class LoadingSignIn extends SigInState {}
final class LoadingLogIn extends SigInState {}
final class SuccessLogIn extends SigInState {}
final class SuccessSignIn extends SigInState {}
final class ErrorSignIn extends SigInState {
  final String error;

  ErrorSignIn({required this.error});
}
final class ErrorLogIn extends SigInState {
final String error;

ErrorLogIn({required this.error});
}
final class ChangeSuccess extends SigInState {}

