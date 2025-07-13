import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'Feature/authantication/presention/view/authentication/authenticationView.dart';
import 'Feature/home/presention/view/card/cardView.dart';
import 'Feature/home/presention/view/category/categoryView.dart';
import 'Feature/home/presention/view/homeView/homeVeiw.dart';
import 'Feature/home/presention/view/homeView/homeWidget/BottomNavigationBar/bottomNavigationBar.dart';

class Homebody extends StatefulWidget {
   Homebody({super.key});

  @override
  State<Homebody> createState() => _HomebodyState();
}

class _HomebodyState extends State<Homebody> {
int currentPageIndex=0;
PageController controller=PageController(initialPage: 0);
  getIndexPage(int index){
  setState(() {
    currentPageIndex=index;
  });
  controller.jumpToPage(currentPageIndex );
}
Void? onChange(int index){
    setState(() {
      currentPageIndex=index;
    });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: onChange,
            children: [
              Homeveiw(),
              Categoryview(),
              Cardview(),
              Authenticationview()
            ],
          ),
          Positioned(
            child: Bottomnavigationbar( indexPageBackFuncation:getIndexPage ,pageIndex:currentPageIndex ,),
            left: 4.w,
            right: 4.w,
            bottom: 1.h,
          )
        ],
      ),
    );
  }
}
