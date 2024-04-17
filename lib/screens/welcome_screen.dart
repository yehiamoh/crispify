import 'package:crispify/widgets/custom_text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:crispify/utils/themes.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/images/WelcomeHome.jpg",
                  fit: BoxFit.cover,
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/astrounut.png",
                  width: 100,
                  height: 91,
                ),
                SizedBox(
                  height: 13.h,
                ),
                Text(
                  "Crispfy",
                  style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25.sp,
                          fontWeight: AppTheme().boldFontWeight)),
                ),
                SizedBox(
                  height: 450.h,
                ),
                CustomTextButton("Log in ", () {}),
                SizedBox(
                  height: 18.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: AppTheme().boldFontWeight,
                        fontSize: 17.sp,
                      )),
                    ),
                    Text(
                      "Sign Up",
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                        color: AppTheme().orangeColor,
                        fontWeight: AppTheme().boldFontWeight,
                        fontSize: 17.sp,
                      )),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
