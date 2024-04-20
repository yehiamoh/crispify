part of 'email_otp_cubit.dart';

@immutable
sealed class EmailOtpState {}

final class EmailOtpInitial extends EmailOtpState {}
final class EmailOtpSuccess extends EmailOtpState {}
final class EmailOtpLoading extends EmailOtpState {}
final class EmailOtpFailed extends EmailOtpState {
  final String?error;
  EmailOtpFailed(this.error);
}
