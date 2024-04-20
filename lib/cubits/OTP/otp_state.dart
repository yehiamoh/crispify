part of 'otp_cubit.dart';

@immutable
sealed class OtpState {}

final class OtpInitial extends OtpState {}
final class OtpLoading extends OtpState {}
final class OtpFailed extends OtpState {
 final String? error;
 OtpFailed(this.error);
}
final class OtpSuccess extends OtpState {
final String? token;
OtpSuccess(this.token);
}
