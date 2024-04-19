import 'package:bloc/bloc.dart';
import 'package:crispify/models/log_in_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final dio = Dio();

  void submitLogin(LogInModel logInModel) async {
    emit(LoginLoading());
    try {
      final response = await dio.post(
          "https://fried-chicken-restaurant-backend-node-js.onrender.com/api/client/login",
          data: logInModel.toJson());
      if (response.statusCode == 200) {
        print(response.data["token"]);
        emit(LoginSuccess(response.data["token"]));
      } else if (response.statusCode == 404) {
        print(response.data["msg"]);
        emit(LoginFailed(response.data["msg"]));
      } else {
        // Handle other status codes here
        emit(LoginFailed("An error occurred"));
      }
    } catch (e) {
      emit(LoginFailed("An error occurred "));
    }
  }
}
