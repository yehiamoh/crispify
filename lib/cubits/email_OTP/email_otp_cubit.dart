import 'package:bloc/bloc.dart';
import 'package:crispify/models/email_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'email_otp_state.dart';

class EmailOtpCubit extends Cubit<EmailOtpState> {
  EmailOtpCubit() : super(EmailOtpInitial());
  final dio=Dio();
  void emailOTP(EmailModel emailModel)async{
emit(EmailOtpLoading());
    try{
      final response= await dio.post("https://fried-chicken-restaurant-backend-node-js.onrender.com/api/client/forgotPassword",data: emailModel.toJson());
      if(response.statusCode == 200){
        emit(EmailOtpSuccess());
      }
      else if(response.statusCode==404){
        emit(EmailOtpFailed("Error"));
      }
      else{
        emit(EmailOtpFailed(" un Expected Error"));
      }
    }catch(e){
      emit(EmailOtpFailed("Email not correct"));
    }
  }
}
