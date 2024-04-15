part of 'custom_text_cubit.dart';

@immutable
sealed class CustomTextState {}

final class CustomTextInitial extends CustomTextState {}
final class LoadingCustom extends CustomTextState {}
final class SuccessCustomText extends CustomTextState {}
final class ChangeSuccess extends CustomTextState {}
final class ErrorCustomText extends CustomTextState {
  final String error;

  ErrorCustomText({required this.error});
}
