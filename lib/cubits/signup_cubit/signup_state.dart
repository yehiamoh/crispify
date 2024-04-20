part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}
final class SignupSuccess extends SignupState {
  final String? token;
  SignupSuccess(this.token);
}
final class SignupFailed extends SignupState {
  final String? error;
  SignupFailed(this.error);
}
final class SignupLoading extends SignupState {}