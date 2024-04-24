import 'package:crispify/cubits/OTP/otp_cubit.dart';
import 'package:crispify/cubits/email_OTP/email_otp_cubit.dart';
import 'package:crispify/cubits/login_cubit/login_cubit.dart';
import 'package:crispify/cubits/reset_password/reset_password_cubit.dart';
import 'package:crispify/cubits/signup_cubit/signup_cubit.dart';
import 'package:crispify/cubits/user_data/user_data_cubit.dart';
import 'package:crispify/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (context)=>LoginCubit()),
        BlocProvider(create: (context)=>SignupCubit()),
        BlocProvider(create: (context)=>EmailOtpCubit()),
        BlocProvider(create: (context)=>OtpCubit()),
        BlocProvider(create: (context)=>ResetPasswordCubit()),
        BlocProvider(create: (context)=>UserDataCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context,child){
         return const MaterialApp(
          debugShowCheckedModeBanner: false,
           home: WelcomeScreen(),
        );
        }
      ),
    );
  }
}

