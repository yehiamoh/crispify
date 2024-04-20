import 'package:bloc/bloc.dart';
import 'package:crispify/models/OTP_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());
  final dio=Dio();
  void OTPSubmition(OtpModel otpModel)async{
    emit(OtpLoading());
    try{
      final respnose=await dio.post("https://fried-chicken-restaurant-backend-node-js.onrender.com/api/client/verfiyOtp",data: otpModel.toJson());
      if(respnose.statusCode==200){
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("otp_token", respnose.data["token"]);
        emit(OtpSuccess(respnose.data["token"]));
      }
    }catch(e){
      emit(OtpFailed("Error occuerd"));
    }
  }
}
