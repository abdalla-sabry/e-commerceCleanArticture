
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../core/utiles/avater.dart';
import '../../../../../../authantication/presention/view/authentication/singIn/SingInVeiwBlocProvider.dart';
import '../../../../../../authantication/presention/view/authentication/singIn/signInView.dart';
import 'Titel&subtilteWidget.dart';

class TopBarSection extends StatelessWidget {
   TopBarSection({super.key,this.user});
User? user;
  @override
  Widget build(BuildContext context) {

    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Titel_subtiltewidget(),
          Padding(
            padding:  EdgeInsets.only(right: 6.w,top: 1.2.h),
            child: Avater(size: 8.5.h,onTap: () {
              Navigator.pushNamed(context, Singinveiwblocprovider.routeName);
            },),
          )
        ],
      ),
    );
  }
}
