import 'package:crispify/screens/log_in_screen.dart';
import 'package:crispify/screens/sign_up_screen.dart';
import 'package:crispify/widgets/custom_text_button.dart';
import 'package:crispify/widgets/icon_and_name.dart';
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
        resizeToAvoidBottomInset: true,
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
               const IconAndNameVertical(),
                SizedBox(
                  height: 450.h,
                ),
                CustomTextButton("Log in ", () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>LogInScreen()));
                }),
                SizedBox(
                  height: 18.h,
                ),
                GestureDetector(
                  onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SignUpScreen())),
                  child: Row(
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
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
