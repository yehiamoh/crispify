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
      final data =response.data;
      print(data["msg"]);
      if (response.statusCode == 200) {
        print("the token is : "+data["token"]);
        emit(LoginSuccess(data["token"]));
      }
      else if (response.statusCode == 404) {
        final message =data["msg"] as String? ??"user not found";
        print(message);
        emit(LoginFailed2(message));
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
