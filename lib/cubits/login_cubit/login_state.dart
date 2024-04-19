part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginSuccess extends LoginState {
  final String? token;
  LoginSuccess(this.token);
}
final class LoginFailed extends LoginState {
  final String? error;
  LoginFailed(this.error);
}
final class LoginLoading extends LoginState {}
