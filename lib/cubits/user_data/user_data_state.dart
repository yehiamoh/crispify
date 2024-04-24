part of 'user_data_cubit.dart';

@immutable
sealed class UserDataState {}

final class UserDataInitial extends UserDataState {}
final class UserDataLoading extends UserDataState {}
final class UserDataSuccess extends UserDataState {
 final UserDataModel? userDataModel;
 UserDataSuccess(this.userDataModel);
}
final class UserDataFailuer extends UserDataState {
  final String? error;
  UserDataFailuer(this.error);
}
