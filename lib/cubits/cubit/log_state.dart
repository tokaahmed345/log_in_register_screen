part of 'log_cubit.dart';

@immutable
sealed class LogState {}

final class LogInitial extends LogState {}
final class Success extends LogState {
  final String message;

  Success({required this.message});
}
final  class LoginLoading extends LogState {}

final class Failure extends LogState {

final String errormessage;

  Failure({required this.errormessage});

}
