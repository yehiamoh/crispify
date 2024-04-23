import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeButtonWidget extends StatelessWidget {
  const ChangeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 53.w,
      height: 26.h,
      padding:  EdgeInsets.all(5.w),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.w,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xFFD1512D),
          ),
          borderRadius: BorderRadius.circular(20.w),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Change',
            style: TextStyle(
              color: Color(0xFFD1512D),
              fontSize: 12.sp,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w700,
              height: 0.h,
            ),
          ),
        ],
      ),
    );
  }
}
