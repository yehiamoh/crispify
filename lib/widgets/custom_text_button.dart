import 'package:crispify/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomTextButton extends StatelessWidget {
  final String? actionName;
  final VoidCallback? onPressed;
  const CustomTextButton(this.actionName, this.onPressed,{super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310.w,
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
            actionName!,
            style: GoogleFonts.nunito(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: AppTheme().boldFontWeight)),
          ),
      ),
    );
  }
}
