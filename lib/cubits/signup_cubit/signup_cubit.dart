import 'package:bloc/bloc.dart';
import 'package:crispify/models/sign_up_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  final dio=Dio();
  void submitSignup (SignUpModel signUpModel)async{
    emit(SignupLoading());
    try{
      final response = await dio.post("https://fried-chicken-restaurant-backend-node-js.onrender.com/api/client/signup",data:  signUpModel.toJson());
      final data= response.data;
      if(response.statusCode==201){
        emit(SignupSuccess(data["token"]));
      }
      if (response.statusCode == 404) {
        final message =data["msg"]??"user not found";
        print(message);
        emit(SignupFailed(message));
      }
      if (response.statusCode == 501) {
        final message =data["msg"]??"user not found";
        print(message);
        emit(SignupFailed(message));
      }
    } catch(e){
      emit(SignupFailed("un expected error occurred"));
        }
  }
}
