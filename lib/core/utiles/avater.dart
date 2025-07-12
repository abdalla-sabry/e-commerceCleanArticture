import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constant/imagesConstante.dart';


class Avater extends StatelessWidget {
    final double size;
  final String? urlImage;
  final VoidCallback? onTap;

  const Avater({super.key,  this.size=40, this.urlImage, this.onTap});

  @override
  Widget build(BuildContext context){
    return GestureDetector(
       onTap: onTap,
      child:urlImage!=null?CachedNetworkImage(
        imageUrl: urlImage!,
        imageBuilder: (context, image) =>
            CircleAvatar(
              radius: size*.35,
              backgroundImage: image,
              backgroundColor: Colors.transparent,
            ),
      )
          : CircleAvatar(
      radius:  size*.35,
      backgroundImage: AssetImage(kUserAvatar),
      backgroundColor: Colors.transparent,
    ),
    ) ;
  }
}
