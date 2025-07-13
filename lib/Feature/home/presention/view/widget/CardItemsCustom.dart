import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utiles/constant/colorConstante.dart';


class Carditemscustom extends StatelessWidget {
  Carditemscustom({super.key, required this.hight, required this.width});
final double hight;
final double width;
  @override
  Widget build(BuildContext context) {
    return         SizedBox(
      height:hight ,
      width: width,
      child: Card(
        color: kBackgroundColor, // keep your theme color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // slightly more rounded
          side: BorderSide(
            color: const Color(
                0xFFD6D5D5), // very light gray like the image border
            width: 1,
          ),
        ),
        elevation: 8, // soft but noticeable shadow
        shadowColor: Colors.black.withOpacity(0.5), // faint natural shadow
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: CachedNetworkImage(
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey.shade100,
              highlightColor: Colors.white,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.grey.shade300,
              ),
            ),
            imageUrl:
            'https://res.cloudinary.com/programming-night/image/upload/v1734179544/E-Shop/Porducts/Razer%20Viper%20V3%20Pro/img-1_i1uvec.jpg',
            fit: BoxFit.contain,
          ),
        ),
      ),
    )
    ;
  }
}
