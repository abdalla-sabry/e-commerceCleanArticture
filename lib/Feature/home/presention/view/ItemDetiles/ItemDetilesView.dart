import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_clean_arcitecture/core/utiles/fontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'ItemDetilesImageWithSmothDot.dart';
import 'ItemDtilesBottomNavigationBar/itemDetilesBottomNavigationBar.dart';

class Itemdetilesview extends StatefulWidget {
  Itemdetilesview({super.key});
  static const String routeName = 'itemDetiles';

  @override
  State<Itemdetilesview> createState() => _ItemdetilesviewState();
}

class _ItemdetilesviewState extends State<Itemdetilesview> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 2.w),
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.message, color: Colors.black),
            onPressed: () {
              // handle message action
            },
          ),
          Padding(
            padding: EdgeInsets.only(right: 2.w),
            child: IconButton(
              icon: Icon(Icons.share, color: Colors.black),
              onPressed: () {
              },
            ),
          ),
        ],
      ),
      body: Hero(
        tag: 'productItem',
        child: Column(
          children: [
            Itemdetilesimagewithsmothdot()],
        ),
      ),
      bottomNavigationBar: Itemdetilesbottomnavigationbar(),
    );
  }
}
