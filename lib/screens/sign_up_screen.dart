import 'package:crispify/widgets/custom_signup_container_ui.dart';
import 'package:crispify/widgets/icon_and_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return SafeArea(
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
                  CustomSignUpContainerUi(
                    onPressed: () {},
                    buttonActionName: "Create account",
                    emailController: emailController,
                    nameController: nameController,
                    userNameController: userNameController,
                    passwordController: passwordController,
                    confirmPasswordController: confirmPasswordController,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
