import 'package:e_commerce_clean_arcitecture/core/utiles/fontStyle.dart';
import 'package:e_commerce_clean_arcitecture/presentation/widget/CardItemsCustom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class Carditem extends StatelessWidget {
  Carditem({super.key});
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Carditemscustom(hight: 20.h, width: 27.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 15.sp,
              ),
              child: isLoading
                  ? Text(
                      'Razer 3v Pro',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 17.sp),
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
              padding: EdgeInsets.only(left: 15.sp, top: 11.sp),
              child: isLoading
                  ? Text(
                      '1556 \$',
                      style: TextStyle(
                        fontSize: 16.5.sp,
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
        )
      ],
    );
  }
}
