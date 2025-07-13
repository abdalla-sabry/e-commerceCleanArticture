import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class CheckoutTotilecost extends StatelessWidget {
  const CheckoutTotilecost({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 11.sp,
          ),
          child: true
              ? Text(
                  'Totel (1 items)',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 17.sp),
                )
              : Shimmer.fromColors(
                  baseColor: Colors.grey.shade100,
                  highlightColor: Colors.white,
                  child: SizedBox(
                    height: 17.sp,
                    child: Container(
                      width: 34.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 11.sp, top: 11.sp),
          child: true
              ? Text(
                  '1556 \$',
                  style: TextStyle(
                      fontSize: 16.5.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                )
              : Shimmer.fromColors(
                  baseColor: Colors.grey.shade100,
                  highlightColor: Colors.white,
                  child: SizedBox(
                    height: 17.sp,
                    child: Container(
                      width: 44.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
