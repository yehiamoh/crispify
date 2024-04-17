import 'package:crispify/widgets/custom_login_container_ui.dart';
import 'package:crispify/widgets/icon_and_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold (
        body: Stack(
          children: [
            SizedBox(child: Image.asset("assets/images/LogIn.jpg", fit: BoxFit.cover,),width: MediaQuery.of(context).size.width,),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  SizedBox(height: 17.h,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     const IconAndNameVertical(),
                   ],
                 ),
                  SizedBox(height: 95.h),
                  CustomLogInContainerUi(onPressed: (){},buttonActionName: "Login",),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
