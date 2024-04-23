import 'package:crispify/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OrdersAndAboutWidget extends StatefulWidget {
  final String? name;
  const OrdersAndAboutWidget({super.key, this.name});

  @override
  State<OrdersAndAboutWidget> createState() => _OrdersAndAboutWidgetState();
}

class _OrdersAndAboutWidgetState extends State<OrdersAndAboutWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 35,
      borderRadius: BorderRadius.circular(25.w),
      child: Container(
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 20.w),
              child: Text(widget.name!,style: GoogleFonts.nunito(
                textStyle:TextStyle(
                    color: Colors.black,
                    fontWeight: AppTheme().boldFontWeight,
                    fontSize: 16.sp))),
            ),
            SizedBox(width: 180.w,),
            IconButton(onPressed: (){}, icon:Icon(Icons.arrow_forward_ios,size: 24.sp)),
          ],
        ),
        width: 320.w,
        height: 60.h,
      
      ),
    ) ;
  }
}
