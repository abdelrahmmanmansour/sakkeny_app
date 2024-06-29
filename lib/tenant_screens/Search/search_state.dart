part of 'search_cubit.dart';

@immutable
abstract class SearchState {}
class SearchInitial extends SearchState {}
class SuccessSearch extends SearchState {}
class ErrorSearch extends SearchState {
  final String error;

  ErrorSearch({required this.error});
}
