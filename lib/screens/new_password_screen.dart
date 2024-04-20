import 'package:crispify/cubits/reset_password/reset_password_cubit.dart';
import 'package:crispify/models/reset_password.dart';
import 'package:crispify/screens/welcome_screen.dart';
import 'package:crispify/utils/themes.dart';
import 'package:crispify/widgets/custom_email_pass_conatiner_ui.dart';
import 'package:crispify/widgets/icon_and_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class NewPasswordScreen extends StatefulWidget {
  final String?token;
  const NewPasswordScreen({super.key, this.token,});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}
class _NewPasswordScreenState extends State<NewPasswordScreen> {
  TextEditingController newPasswordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit,ResetPasswordState>(listener: (context,state){
      if(state is ResetPasswordSuccess){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>WelcomeScreen()), (route) => false);
      }
      else if(state is ResetPasswordLoading){
        const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      else if(state is ResetPasswordFailed){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error!), backgroundColor: Colors.red));
      }

      },child: SafeArea(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const IconAndNameVertical(),
                    ],
                  ),
                  SizedBox(height: 95.h),
                  CustomEmailAndPasswordContainerUi(
                    isPasswordScreen: true,
                    onPressed: (){
                      final resetPasswordModel =ResetPasswordModel(password: newPasswordController.text, token: widget.token!);
                      BlocProvider.of<ResetPasswordCubit>(context).resetPassword(resetPasswordModel);
                    },
                    buttonActionName: "submit",
                    controller: newPasswordController,
                    headerText: "Enter your New password",
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
