import 'package:crispify/utils/themes.dart';
import 'package:crispify/widgets/orders_and_about_widget.dart';
import 'package:crispify/widgets/profile_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true , // to make the title center
           title : Text("Profile",style: GoogleFonts.nunito(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: AppTheme().boldFontWeight,
                    fontSize: 24.sp))),
          ),
          body: Column(
            children: [
              SizedBox(height: 56.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(" name ",style:  GoogleFonts.nunito(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: AppTheme().boldFontWeight,
                          fontSize: 20.sp)),)
                ],
              ),
              SizedBox(height: 84.h,),
              ProfileInfoWidget(userEmail: "email",userName: "name",name: "name",),
              SizedBox(height: 32.h,),
              OrdersAndAboutWidget(name: "Orders",),
              SizedBox(height: 32.h,),
              OrdersAndAboutWidget(name:"Help",),



            ],
          ),

    ));
  }
}
