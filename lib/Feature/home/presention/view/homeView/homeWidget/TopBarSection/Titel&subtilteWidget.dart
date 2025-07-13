import 'package:e_commerce_clean_arcitecture/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../core/utiles/fontStyle.dart';


class Titel_subtiltewidget extends StatelessWidget {
  const Titel_subtiltewidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:  EdgeInsets.only(left:4.5.w ,top: 5.5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome,',
            style: styleText.TitleTextStyle,
          ),
          Text(
            'E-Shop mobile store',
            style: styleText.SubTitleTextStyle,
          ),
        ],
      ),
    );
  }
}
