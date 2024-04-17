import 'package:crispify/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSignUpContainerUi extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? buttonActionName;
  const CustomSignUpContainerUi({super.key, this.onPressed, this.buttonActionName});

  @override
  Widget build(BuildContext context) {
    return  Material(
      borderRadius: BorderRadius.circular(40),
      elevation: 35,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 505.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to Crispify",style: GoogleFonts.nunito(
                textStyle:TextStyle(
                    color: AppTheme().BlackColor,
                    fontWeight: AppTheme().boldFontWeight,
                    fontSize: 24
                )
            ),),
            SizedBox(height: 29.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 45.w),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Name",
                  hintStyle:GoogleFonts.nunito(
                      textStyle:TextStyle(
                          color:Color(0xffb2b2b2),
                          fontWeight: AppTheme().boldFontWeight,
                          fontSize: 17
                      )
                  ),
                ),
              ),
            ),
            SizedBox(height: 35.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 45.w),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle:GoogleFonts.nunito(
                      textStyle:TextStyle(
                          color:Color(0xffb2b2b2),
                          fontWeight: AppTheme().boldFontWeight,
                          fontSize: 17
                      )
                  ),
                ),
              ),
            ),
            SizedBox(height: 35.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 45.w),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "password",
                  hintStyle:GoogleFonts.nunito(
                      textStyle:TextStyle(
                          color:Color(0xffb2b2b2),
                          fontWeight: AppTheme().boldFontWeight,
                          fontSize: 17
                      )
                  ),
                ),
              ),
            ),
            SizedBox(height: 80.h,),
            Container(
              width: 266.w,
              height: 58.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0.sp),
                color:  AppTheme().orangeColor, // Background color
              ),
              child: TextButton(
                onPressed: onPressed,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                ),
                child: Text(
                  buttonActionName!,
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
    );
  }
}
