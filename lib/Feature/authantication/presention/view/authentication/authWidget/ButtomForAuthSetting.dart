import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ButtomforAuthSetting extends StatelessWidget {
  ButtomforAuthSetting({super.key, required this.buttomName,required this.onTapFunction, this.isVisable});
  final String buttomName;
   void Function() onTapFunction;
   bool? isVisable;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisable??true,
      child: GestureDetector(
        onTap:onTapFunction ,
        child: Stack(
           children: [
             Container(
               height: 8.8.h,
               width: double.infinity,
               decoration: BoxDecoration(
                 color: Colors.white,
                   borderRadius: BorderRadius.circular(12),
                   border:Border.all(   color: Colors.black26,width: .25) ,
                   boxShadow: [BoxShadow(
                       color: Colors.black.withOpacity(0.15),
                       offset: Offset(0, 1),
                       spreadRadius: 1.2
                       ,blurRadius: 2
                   )]
               ),
             ),
             Positioned(left: 5.w,top: 2.5.h,
                 child:  Text(
               buttomName,
               style: TextStyle(
                 fontSize: 17.5.sp,
                 fontWeight: FontWeight.w500,
               ),
             ))

           ],
        ),
      ),
    );
  }
}
