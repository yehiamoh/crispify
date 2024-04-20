import 'package:crispify/cubits/email_OTP/email_otp_cubit.dart';
import 'package:crispify/models/email_model.dart';
import 'package:crispify/screens/OTP_screen.dart';
import 'package:crispify/screens/new_password_screen.dart';
import 'package:crispify/utils/themes.dart';
import 'package:crispify/widgets/custom_email_pass_conatiner_ui.dart';
import 'package:crispify/widgets/icon_and_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({
    super.key,
  });

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<EmailOtpCubit, EmailOtpState>(
      listener: (context, state) {
        if(state is EmailOtpSuccess){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>OTPScreen(email: emailController.text,)), (route) => false);
        }
       else if(state is EmailOtpFailed){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error!), backgroundColor: Colors.red));
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
               SizedBox(
                child: Image.asset(
                  "assets/images/LogIn.jpg",
                  fit: BoxFit.fill,
                ),
                width: MediaQuery.of(context).size.width,
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 17.h,
                    ),
                   const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         IconAndNameVertical(),
                      ],
                    ),
                    SizedBox(height: 95.h),
                 BlocBuilder<EmailOtpCubit,EmailOtpState>(builder: (context,state){
                   if (state is EmailOtpLoading) {
                     return  Center(
                         child: CircularProgressIndicator(
                           color: AppTheme().orangeColor,
                         ));
                   }

                  return CustomEmailAndPasswordContainerUi(
                   isPasswordScreen: false,
                   onPressed: () {
                     final emailModel=EmailModel(email: emailController.text);
                     BlocProvider.of<EmailOtpCubit>(context).emailOTP(emailModel);
                   },
                   buttonActionName: "submit",
                   controller: emailController,
                   headerText: "Enter your Email",
                 );
  }
                 )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
