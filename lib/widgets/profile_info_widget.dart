import 'package:crispify/utils/themes.dart';
import 'package:crispify/widgets/change_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileInfoWidget extends StatefulWidget {
  final String?userName;
  final String?userEmail;
  final String?name;
  const ProfileInfoWidget({super.key, this.userName, this.userEmail, this.name});

  @override
  State<ProfileInfoWidget> createState() => _ProfileInfoWidgetState();
}

class _ProfileInfoWidgetState extends State<ProfileInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 35,
      borderRadius: BorderRadius.circular(25.w),
      child: SizedBox(
        width: 320.w,
        height: 182.h,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.name!,style: GoogleFonts.nunito(
                    textStyle:TextStyle(
                        color: Colors.black,
                        fontWeight: AppTheme().boldFontWeight,
                        fontSize: 16.sp),
                    ),
                  ),
                  ChangeButtonWidget(),
                ],
              ),
              SizedBox(height: 21.h,),
              Container(color: Color(0xffA53415),width:285.w ,height: 1.h,),
              SizedBox(height: 14.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.userName!,style: GoogleFonts.nunito(
                    textStyle:TextStyle(
                        color: Colors.black,
                        fontWeight: AppTheme().boldFontWeight,
                        fontSize: 16.sp),
                    ),
                  ),
                  ChangeButtonWidget(),
                ],
              ),
              SizedBox(height: 21.h,),
              Container(color: Color(0xffA53415),width:285.w ,height: 1.h,),
              SizedBox(height: 14.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.userEmail!,style: GoogleFonts.nunito(
                    textStyle:TextStyle(
                        color: Colors.black,
                        fontWeight: AppTheme().boldFontWeight,
                        fontSize: 16.sp),
                    ),
                  ),
                  ChangeButtonWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
