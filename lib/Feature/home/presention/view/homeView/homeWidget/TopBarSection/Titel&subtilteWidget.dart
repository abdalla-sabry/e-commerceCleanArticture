import 'package:e_commerce_clean_arcitecture/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../core/utiles/fontStyle.dart';


class Titel_subtiltewidget extends StatelessWidget {
   Titel_subtiltewidget({super.key,this.user});
User? user;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:  EdgeInsets.only(left:4.5.w ,top: 5.5.h),
      child:user==null?
      Column(
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
      ):
    Text("${user!.first_name} ${user.last_name}",
    style: TextStyle(fontSize: 18.sp),
    );
  }
}
