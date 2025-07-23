import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../authantication/presention/mangment/getUserData/get_user_data_cubit.dart';
import '../../../authantication/presention/view/authentication/SettingVeiw.dart';
import 'card/cardView.dart';
import 'category/categoryView.dart';
import 'homeView/HomeVeiwBlocProvider.dart';
import 'homeView/homeVeiw.dart';
import 'homeView/homeWidget/BottomNavigationBar/bottomNavigationBar.dart';

class Homebody extends StatefulWidget {
  Homebody({super.key});
  static const routeName = 'Homebody';
  @override
  State<Homebody> createState() => _HomebodyState();
}

class _HomebodyState extends State<Homebody> {
  int currentPageIndex = 0;
  String? email;

  @override
  void initState() {
    super.initState();


  }


  PageController controller = PageController(initialPage: 0);
  getIndexPage(int index) {
    setState(() {
      currentPageIndex = index;
    });
    controller.jumpToPage(currentPageIndex);
  }

  Void? onChange(int index) {
    setState(() {
      currentPageIndex = index;
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
            children: [Homeveiwblocprovider(), Categoryview(), Cardview(), settingVeiw()],
          ),
          Positioned(
            child: Bottomnavigationbar(
              indexPageBackFuncation: getIndexPage,
              pageIndex: currentPageIndex,
            ),
            left: 4.w,
            right: 4.w,
            bottom: 1.h,
          )
        ],
      ),
    );
  }
}
