import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/CardItemsCustom.dart';


class Carditems extends StatelessWidget {
    Carditems({super.key,required this.onTap});
  static const bool islodaing=true;
    GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5.sp),
            child: islodaing
                ?
                 Carditemscustom(
                    width: 57.sp,
                    hight: 72.sp,
                  ):Shimmer.fromColors(
              baseColor: Colors.grey.shade100,
              highlightColor: Colors.white,
              child: SizedBox(
                height: 66.sp,
                child: Container(
                  width: 56.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 11.sp, top: 10.sp),
            child: islodaing
                ? Text(
                    'Razer 3v Pro',
                    style:  TextStyle(fontWeight: FontWeight.w600,fontSize: 17.sp),
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
            padding: EdgeInsets.only(left: 11.sp, top: 3.sp),
            child: islodaing
                ? Text(
                    '1556 \$',
                    style:  TextStyle(
                      fontSize:  16.5.sp,
                      fontWeight: FontWeight.w700,
                    ),
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
      ),
    );
  }
}
