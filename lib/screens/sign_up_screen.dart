import 'package:crispify/cubits/signup_cubit/signup_cubit.dart';
import 'package:crispify/models/sign_up_model.dart';
import 'package:crispify/screens/bottom_nav_bar_screen.dart';
import 'package:crispify/screens/log_in_screen.dart';
import 'package:crispify/utils/themes.dart';
import 'package:crispify/widgets/custom_signup_container_ui.dart';
import 'package:crispify/widgets/icon_and_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit,SignupState>(
      listener: (context,state){
        if(state is SignupSuccess){
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const LogInScreen()), (route) => false);
        }
       else if (state is SignupFailed) {
          //_isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error!), backgroundColor: Colors.red));
        }

      },
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/images/LogIn.jpg",
                  fit: BoxFit.cover,
                ),
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
                    BlocBuilder<SignupCubit,SignupState>(builder:(context,state){
                      if (state is SignupLoading) {
                        // _isLoading = true;
                          return Center(
                            child: CircularProgressIndicator(color: AppTheme().orangeColor,),
                        );
                      }
                     return CustomSignUpContainerUi(
                        onPressed: () {
                          final singUpModel=SignUpModel(name: nameController.text, username: userNameController.text, email: emailController.text, password: passwordController.text, confirmPassword: confirmPasswordController.text);
                          BlocProvider.of<SignupCubit>(context).submitSignup(singUpModel);
                        },
                        buttonActionName: "Create account",
                        emailController: emailController,
                        nameController: nameController,
                        userNameController: userNameController,
                        passwordController: passwordController,
                        confirmPasswordController: confirmPasswordController,
                      );
                    } )

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
