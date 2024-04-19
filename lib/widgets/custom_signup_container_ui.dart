import 'package:crispify/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSignUpContainerUi extends StatefulWidget {
  final VoidCallback? onPressed;
  final String? buttonActionName;
  final TextEditingController? nameController;
  final TextEditingController ?userNameController;
  final TextEditingController ?emailController;
  final TextEditingController ?passwordController;
  final TextEditingController ?confirmPasswordController;
  const CustomSignUpContainerUi(
      {super.key,
      this.onPressed,
      this.buttonActionName,
       this.nameController,
       this.userNameController,
       this.emailController,
       this.passwordController,
       this.confirmPasswordController});
  @override
  State<CustomSignUpContainerUi> createState() =>
      _CustomSignUpContainerUiState();
}
class _CustomSignUpContainerUiState extends State<CustomSignUpContainerUi> {
  GlobalKey<FormState> signUpFromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(40),
      elevation: 35,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 610.h,
        child: Form(
          key: signUpFromKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to Crispify",
                style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                        color: AppTheme().BlackColor,
                        fontWeight: AppTheme().boldFontWeight,
                        fontSize: 24)),
              ),
              SizedBox(
                height: 29.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.w),
                child: TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "Name cannot be empty";
                    }
                  },
                  controller: widget.nameController,
                  style:  GoogleFonts.nunito(
                      textStyle: TextStyle(
                          color: AppTheme().BlackColor,
                          fontSize: 17.sp,
                          fontWeight: AppTheme().boldFontWeight)),
                  decoration: InputDecoration(
                    hintText: "Name",
                    hintStyle: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            color: Color(0xffb2b2b2),
                            fontWeight: AppTheme().boldFontWeight,
                            fontSize: 17.sp)),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.w),
                child: TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "User Name cannot be empty";
                    }
                  },
                  controller: widget.userNameController,
                  style:  GoogleFonts.nunito(
                      textStyle: TextStyle(
                          color: AppTheme().BlackColor,
                          fontSize: 17.sp,
                          fontWeight: AppTheme().boldFontWeight)),
                  decoration: InputDecoration(
                    hintText: "User Name",
                    hintStyle: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            color: Color(0xffb2b2b2),
                            fontWeight: AppTheme().boldFontWeight,
                            fontSize: 17.sp)),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.w),
                child: TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "Email cannot be empty";
                    }
                    if(!(value!.contains("@"))||!(value!.contains("."))){
                      return "Please Enter a valid Email";
                    }
                  },
                  controller: widget.emailController,
                  style:  GoogleFonts.nunito(
                      textStyle: TextStyle(
                          color: AppTheme().BlackColor,                          fontSize: 20.sp,
                          fontWeight: AppTheme().boldFontWeight)),
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            color: Color(0xffb2b2b2),
                            fontWeight: AppTheme().boldFontWeight,
                            fontSize: 17.sp)),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.w),
                child: TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "password cannot be empty";
                    }
                    if(value!.length<6){
                      return "Minimum password Length is 6";
                    }
                  },
                  controller: widget.passwordController,
                  style:  GoogleFonts.nunito(
                      textStyle: TextStyle(
                          color:  AppTheme().BlackColor,
                          fontSize: 17.sp,
                          fontWeight: AppTheme().boldFontWeight)),
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            color: Color(0xffb2b2b2),
                            fontWeight: AppTheme().boldFontWeight,
                            fontSize: 17.sp)),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.w),
                child: TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "cannot be empty";
                    }
                    if (value != widget.passwordController!.text) {
                      return 'Passwords do not match.';
                    }
                  },
                  controller: widget.confirmPasswordController,
                  style:  GoogleFonts.nunito(
                      textStyle: TextStyle(
                          color: AppTheme().BlackColor,
                          fontSize: 17.sp,
                          fontWeight: AppTheme().boldFontWeight)),
                  decoration: InputDecoration(
                    hintText: "confirm password",
                    hintStyle: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            color: Color(0xffb2b2b2),
                            fontWeight: AppTheme().boldFontWeight,
                            fontSize: 17.sp)),
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                width: 266.w,
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0.sp),
                  color: AppTheme().orangeColor, // Background color
                ),
                child: TextButton(
                  onPressed: (){
                    // gemini recommendation for current state validation and doing the function i want
                    signUpFromKey.currentState!.save();
                    if (signUpFromKey.currentState!.validate()) {
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
              // SizedBox(height: 18.h,),
              // TextButton(onPressed: (){}, child:Text("Forgot Password?",style: GoogleFonts.nunito(
              //     textStyle:TextStyle(
              //       color: Color(0xff5d5d5d),
              //       fontSize: 12,
              //       fontWeight: AppTheme().normalFontWeight,
              //     )
              // ),))
            ],
          ),
        ),
      ),
    );
  }
}
