import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../ButtomForAuthSetting.dart';

class Listbuttomsettings extends StatelessWidget {
   Listbuttomsettings({super.key});
List<ButtomforAuthSetting>buttomForAuthSettingList=[
  ButtomforAuthSetting(buttomName: 'Profile',onTapFunction: (){},),
  ButtomforAuthSetting(buttomName: 'orders',onTapFunction: (){},),
  ButtomforAuthSetting(buttomName: 'Deliver Info',onTapFunction: (){},),
  ButtomforAuthSetting(buttomName: 'Setting',onTapFunction: (){}, isVisable: false,),
  ButtomforAuthSetting(buttomName: 'Notifacations',onTapFunction: (){},),
  ButtomforAuthSetting(buttomName: 'About',onTapFunction: (){},),
  ButtomforAuthSetting(buttomName: 'Sign out',onTapFunction: (){},),

];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
       itemCount: buttomForAuthSettingList.length,
      shrinkWrap: true,
      separatorBuilder: (context, index) {
     return   SizedBox(
          height: 2.h,
        );
      },
      itemBuilder: (context, index) {
        return buttomForAuthSettingList[index];
      },
    );
  }
}
