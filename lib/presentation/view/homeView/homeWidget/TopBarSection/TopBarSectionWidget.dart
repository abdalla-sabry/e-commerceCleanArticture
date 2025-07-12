import 'package:e_commerce_clean_arcitecture/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utiles/avater.dart';
import 'Titel&subtilteWidget.dart';

class TopBarSection extends StatelessWidget {
  const TopBarSection({super.key});

  @override
  Widget build(BuildContext context) {

    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Titel_subtiltewidget(),
          Padding(
            padding:  EdgeInsets.only(right: 6.w,top: 1.2.h),
            child: Avater(size: 8.5.h,),
          )
        ],
      ),
    );
  }
}
