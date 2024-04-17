import 'package:crispify/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class IconAndNameVertical extends StatelessWidget {
  const IconAndNameVertical({super.key});
  @override
  Widget build(BuildContext context) {
    return Column (
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
      ],
    );
  }
}
