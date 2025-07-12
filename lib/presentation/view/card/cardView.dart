import 'package:e_commerce_clean_arcitecture/core/utiles/fontStyle.dart';
import 'package:e_commerce_clean_arcitecture/presentation/view/card/CardItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'CardWidget/CheckOutWidget/CheckOutWidget.dart';

class Cardview extends StatelessWidget {
  const Cardview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(right: 6.w,left: 6.w,top:7.h,bottom: 10.h ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        Carditem(),
            Checkoutwidget()
          ],
        ),
      ),

    );
  }
}
