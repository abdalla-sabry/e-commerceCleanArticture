import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_clean_arcitecture/core/utiles/fontStyle.dart';
import 'package:e_commerce_clean_arcitecture/presentation/view/ItemDetiles/ItemDetilesView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utiles/constant/colorConstante.dart';
import 'cardItems.dart';

class Productgrid extends StatelessWidget {
  const Productgrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 18.sp, left: 18.sp, top: 4.sp),
      child: RefreshIndicator(
        onRefresh: () async {},
        child: GridView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: 16,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.55,
            crossAxisSpacing: 6,
            mainAxisSpacing: 4,
          ),
          itemBuilder: (context, index) {
            return Carditems(onTap: (){
Navigator.pushNamed(context, Itemdetilesview.routeName);
            },);
          },
        ),
      ),
    );
  }
}
