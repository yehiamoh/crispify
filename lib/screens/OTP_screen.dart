import 'package:crispify/cubits/OTP/otp_cubit.dart';
import 'package:crispify/models/OTP_model.dart';
import 'package:crispify/screens/new_password_screen.dart';
import 'package:crispify/utils/themes.dart';
import 'package:crispify/widgets/custom_email_pass_conatiner_ui.dart';
import 'package:crispify/widgets/icon_and_name.dart';
import 'package:crispify/widgets/otp_container_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTPScreen extends StatefulWidget {
  final String?email;
  const OTPScreen({
    super.key, this.email,
  });

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController OTPController = TextEditingController();
  // Future<String> getToken ()async{
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String? token =prefs.getString("otp_token");
  //   return token!;
  // }
  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpCubit, OtpState>(
        listener: (context, state) {
          if(state is OtpSuccess){
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>NewPasswordScreen(token: state.token,)), (route) => false);
          }
          else if(state is OtpFailed){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error!), backgroundColor: Colors.red));
          }
        },
        child: SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                SizedBox(
                  child: Image.asset(
                    "assets/images/LogIn.jpg",
                    fit: BoxFit.fill,
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 17.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const IconAndNameVertical(),
                        ],
                      ),
                      SizedBox(height: 95.h),
                     BlocBuilder<OtpCubit,OtpState>(builder: (context,state) {
                       if (state is OtpLoading) {
                         return  Center(
                             child: CircularProgressIndicator(
                               color: AppTheme().orangeColor,
                             ));
                       }
                       return OTPCustomConatainerUI(
                         onPressed: () {
                           final otpModel = OtpModel(
                               userotp: OTPController.text,
                               email: widget.email!);
                           BlocProvider.of<OtpCubit>(context).OTPSubmition(
                               otpModel);
                         },
                         buttonActionName: "submit",
                         controller: OTPController,
                       );
                     })
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
