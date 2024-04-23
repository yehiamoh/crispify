import 'package:crispify/screens/email_verification_screen.dart';
import 'package:crispify/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLogInContainerUi extends StatefulWidget {
  final VoidCallback? onPressed;
  final String? buttonActionName;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  const CustomLogInContainerUi(
      {super.key,
      this.onPressed,
      this.buttonActionName,
      this.emailController,
      this.passwordController});

  @override
  State<CustomLogInContainerUi> createState() => _CustomLogInContainerUiState();
}

class _CustomLogInContainerUiState extends State<CustomLogInContainerUi> {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(40.w),
      elevation: 35,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 505.h,
        child: Form(
          key: loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to Crispify",
                style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                        color: AppTheme().BlackColor,
                        fontWeight: AppTheme().boldFontWeight,
                        fontSize: 24.sp)),
              ),
              SizedBox(
                height: 78.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.w),
                child: TextFormField(
                  style:  GoogleFonts.nunito(
                      textStyle: TextStyle(
                          color: AppTheme().BlackColor,
                          fontSize: 17.sp,
                          fontWeight: AppTheme().boldFontWeight)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email cannot be Empty";
                    }
                    if (!value.contains('@') || !value.contains(".")) {
                      return "Enter a valid Email";
                    }
                  },
                  controller: widget.emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            color: const Color(0xffb2b2b2),
                            fontWeight: AppTheme().boldFontWeight,
                            fontSize: 17.sp)),
                  ),
                ),
              ),
              SizedBox(
                height: 41.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.w),
                child: TextFormField(
                  style:  GoogleFonts.nunito(
                      textStyle: TextStyle(
                          color: AppTheme().BlackColor,
                          fontSize: 17.sp,
                          fontWeight: AppTheme().boldFontWeight)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "password cannot be empty";
                    }
                    if (value.length < 6) {
                      return "password must be 6 character or more";
                    }
                  },
                  controller: widget.passwordController,
                  decoration: InputDecoration(
                    hintText: "password",
                    hintStyle: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            color: const Color(0xffb2b2b2),
                            fontWeight: AppTheme().boldFontWeight,
                            fontSize: 17.sp)),
                  ),
                ),
              ),
              SizedBox(
                height: 80.h,
              ),
              Container(
                width: 266.w,
                height: 58.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0.sp),
                  color: AppTheme().orangeColor, // Background color
                ),
                child: TextButton(
                  onPressed: () {
                    // gemini recommendation for current state validation and doing the function i want
                    loginFormKey.currentState!.save();
                    if (loginFormKey.currentState!.validate()) {
                      if (widget.onPressed != null) {
                        widget.onPressed!();
                      }
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: Text(
                    widget.buttonActionName!,
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: AppTheme().boldFontWeight)),
                  ),
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>EmailVerificationScreen()));
                  },
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                      color: const Color(0xff5d5d5d),
                      fontSize: 12,
                      fontWeight: AppTheme().normalFontWeight,
                    )),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
