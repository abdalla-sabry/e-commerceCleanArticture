import 'dart:ffi';

import 'package:e_commerce_clean_arcitecture/core/utiles/fontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:sizer/sizer.dart';

class Bottomnavigationbar extends StatelessWidget {
   Bottomnavigationbar({super.key,required this.indexPageBackFuncation,required this.pageIndex});
  final void Function(int ) indexPageBackFuncation;
  int pageIndex;
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: SnakeNavigationBar.color(
        onTap: indexPageBackFuncation,
        behaviour: SnakeBarBehaviour.floating,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        currentIndex:pageIndex ,
        backgroundColor: Colors.black87,
        selectedItemColor: Colors.white,
        snakeShape: SnakeShape.indicator,
        snakeViewColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
          fontSize: 12,
        ),
        height: 8.h,
        elevation: 4,
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/navbar_icons/home.png"),
              color: Colors.white,
              size: 20.sp,
            ),
            activeIcon: Padding(
              padding: EdgeInsets.all(0.5.h),
              child: CircleAvatar(
                backgroundColor: Colors.deepOrange,
                maxRadius: 4,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/navbar_icons/categories.png"),
                color: Colors.white,
                size: 20.sp,
              ),
              activeIcon: Padding(
                padding: EdgeInsets.all(0.5.h),
                child: CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  maxRadius: 4,
                ),
              ),
              label: 'Category'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/navbar_icons/shopping-cart.png"),
                color: Colors.white,
                size: 20.sp,
              ),
              activeIcon: Padding(
                padding: EdgeInsets.all(0.5.h),
                child: CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  maxRadius: 4,
                ),
              ),
              label: 'Cart'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/navbar_icons/user.png"),
                color: Colors.white,
                size: 20.sp,
              ),
              activeIcon: Padding(
                padding: EdgeInsets.all(0.5.h),
                child: CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  maxRadius: 4,
                ),
              ),
              label: 'Other'),
        ],
      ),
    );
  }
}
