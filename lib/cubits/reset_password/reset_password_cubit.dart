import 'package:bloc/bloc.dart';
import 'package:crispify/models/reset_password.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());
  final dio =Dio();

  void resetPassword(ResetPasswordModel resestPassword)async{
    emit(ResetPasswordLoading());
    try{
      final respnose=await dio.put("https://fried-chicken-restaurant-backend-node-js.onrender.com/api/client/resetPassword",data: resestPassword.toJson());
      if(respnose.statusCode==200){
        emit(ResetPasswordSuccess());
      }
      else{
        emit(ResetPasswordFailed("error"));
      }

    }catch(e){
      emit(ResetPasswordFailed("try again later"));
    }
  }

}
