import 'package:crispify/screens/favourite_screen.dart';
import 'package:crispify/screens/history_screen.dart';
import 'package:crispify/screens/home_screen.dart';
import 'package:crispify/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentIndex=0;
  final List<Widget> listOfScreens=[
    HomeScreen(),
    FavouriteScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listOfScreens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,// because of there are more than three items
        backgroundColor: const Color(0xffD1512D).withOpacity(0.550), //adding with opacity to decrease the contrast of color
        selectedItemColor: const Color(0xffA53415),
        unselectedItemColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex=index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 24.sp,),
              label: "Home",
          ), BottomNavigationBarItem(
            icon: Icon(Icons.favorite,size: 24.sp,),
            label: "Favorite"
          ), BottomNavigationBarItem(
            icon: Icon(Icons.history,size: 24.sp,),
              label: "History"
          ), BottomNavigationBarItem(
            icon: Icon(Icons.person,size: 24.sp,),
            label: "Profile",
          ),
      ],
      ),
    );
  }
}
