import 'package:bloc/bloc.dart';
import 'package:crispify/models/log_in_model.dart';
import 'package:crispify/service/shares_prefrence_services.dart';
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
      final data =response.data;
      print(data["msg"]);
      if (response.statusCode == 200) {
        final token = response.data['token']; // Replace with your token path
        await SharedPrefService.storeToken(token);
        emit(LoginSuccess(token));
      }
      else {
        // Handle unexpected status codes gracefully
        emit(LoginFailed(
            "An unexpected error occurred (status code: ${response.statusCode})"));
      }

    } on DioException catch (e) {
      emit(LoginFailed("An error occurred"));
    }
  }
}
