import 'package:e_commerce_clean_arcitecture/presentation/view/authentication/authWidget/authUserProfileDetiles/authUserprofileDetiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'authWidget/ButtomForAuthSetting.dart';
import 'authWidget/authUserProfileDetiles/ListButtomSettings.dart';

class Authenticationview extends StatelessWidget {
  const Authenticationview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 5.5.w,vertical: 4.5.h),
        child: Column(
          children: [
        AuthUserProfileDetiles(),
            SizedBox(
              height: 2.h,
            ),
            Listbuttomsettings()          ],
        ),
      ),
    );
  }
}
