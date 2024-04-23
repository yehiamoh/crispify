import 'package:crispify/cubits/login_cubit/login_cubit.dart';
import 'package:crispify/models/log_in_model.dart';
import 'package:crispify/screens/bottom_nav_bar_screen.dart';
import 'package:crispify/utils/themes.dart';
import 'package:crispify/widgets/custom_login_container_ui.dart';
import 'package:crispify/widgets/icon_and_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginFailed) {
            //_isLoading = false;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error!), backgroundColor: Colors.red));

          } else if (state is LoginSuccess) {
            // _isLoading = false;
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => BottomNavBarScreen()), (route) => false);
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
                      BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                        if (state is LoginLoading) {
                          // _isLoading = true;
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppTheme().orangeColor,
                              ),
                            );

                        }
                        return CustomLogInContainerUi(
                          onPressed: () {
                            final loginModel = LogInModel(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            BlocProvider.of<LoginCubit>(context)
                                .submitLogin(loginModel);
                            //  _isLoading = true;
                          },
                          buttonActionName: "Login",
                          emailController: emailController,
                          passwordController: passwordController,
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
