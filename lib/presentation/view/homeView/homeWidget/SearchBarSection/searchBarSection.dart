import 'package:e_commerce_clean_arcitecture/presentation/widget/InputFormButton.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../widget/searchBarTextFeild.dart';

class Searchbarsection extends StatelessWidget {
  const Searchbarsection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(right: 6.w, left: 6.w, top: 1.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Searchbartextfeild(
              hintText: 'Search Product',
                  edgeInsetsGeometry:   EdgeInsets.only(
            top: 17.sp, right: 16.sp, left: 16.sp, bottom: 15.sp),
            )),
            SizedBox(width: 3.w),
            Container(
              height: 6.h,
              width: 7.2.h,
              child: InputFormButton(onClick: () {}),
            )
          ],
        ),
      ),
    );
  }
}
