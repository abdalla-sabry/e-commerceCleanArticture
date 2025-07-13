import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import 'ChackoutButton.dart';
import 'CheckOutTotileCost.dart';

class Checkoutwidget extends StatelessWidget {
  Checkoutwidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(color: Colors.black, width: 2),
            bottom: BorderSide(color: Colors.black, width: 2),),
        color: Colors.white24,
        borderRadius: BorderRadius.only(),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 2.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CheckoutTotilecost(),
            Padding(
              padding:  EdgeInsets.only(bottom: 1.7.h),
              child: CheckoutButton(),
            )
          ],
        ),
      ),
    );
  }
}
