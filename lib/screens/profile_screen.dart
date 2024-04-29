import 'package:crispify/cubits/user_data/user_data_cubit.dart';
import 'package:crispify/utils/themes.dart';
import 'package:crispify/widgets/orders_and_about_widget.dart';
import 'package:crispify/widgets/profile_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserDataCubit>(context)
        .getProfile(); // Trigger data fetching on initialization
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        if (state is UserDataSuccess){
          return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: true, // to make the title center
                  title: Text("Profile",
                  style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: AppTheme().boldFontWeight,
                          fontSize: 24.sp))),
            ),
                body:Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  ProfileInfoWidget(
                    userName: state.userDataModel!.username,
                    userEmail: state.userDataModel!.email,
                    name: state.userDataModel!.name,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                 const OrdersAndAboutWidget(
                    name: "Orders",
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                      const OrdersAndAboutWidget(
                    name: "Help",
                  ),
                                ],
                              ),
                ),
          ));
        }
        if (state is UserDataLoading) {
          return  SafeArea(
              child: Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(color: AppTheme().orangeColor,),
            ),
          ));
        }
        if(state is UserDataFailuer){
          return SafeArea(
              child: Scaffold(
                body: Center(
                  child: Text(state.error!),
                ),
              ));
        }
        return Text("Error Occured");
      },
    );
  }
}
