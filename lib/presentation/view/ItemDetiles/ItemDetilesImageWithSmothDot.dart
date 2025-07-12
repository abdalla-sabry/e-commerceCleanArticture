import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_clean_arcitecture/core/utiles/fontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Itemdetilesimagewithsmothdot extends StatefulWidget {
  const Itemdetilesimagewithsmothdot({super.key});

  @override
  State<Itemdetilesimagewithsmothdot> createState() =>
      _ItemdetilesimagewithsmothdotState();
}

class _ItemdetilesimagewithsmothdotState
    extends State<Itemdetilesimagewithsmothdot> {
  int currentIndex = 0;

  // ✅ Now using just URLs for cleaner mapping
  final List<String> imageUrls = [
    "https://res.cloudinary.com/programming-night/image/upload/v1734179544/E-Shop/Porducts/Razer%20Viper%20V3%20Pro/img-1_i1uvec.jpg",
    "https://res.cloudinary.com/programming-night/image/upload/v1734179552/E-Shop/Porducts/Razer%20Viper%20V3%20Pro/img-2_gpinqg.jpg",
    "https://res.cloudinary.com/programming-night/image/upload/v1734179562/E-Shop/Porducts/Razer%20Viper%20V3%20Pro/img-3_wk8b6m.jpg",
    "https://res.cloudinary.com/programming-night/image/upload/v1734179562/E-Shop/Porducts/Razer%20Viper%20V3%20Pro/img-4_av2vuk.jpg",
    "https://res.cloudinary.com/programming-night/image/upload/v1734179562/E-Shop/Porducts/Razer%20Viper%20V3%20Pro/img-5_nev0tq.jpg",
    "https://res.cloudinary.com/programming-night/image/upload/v1734179562/E-Shop/Porducts/Razer%20Viper%20V3%20Pro/img-6_zdovsx.jpg",
    "https://res.cloudinary.com/programming-night/image/upload/v1734179561/E-Shop/Porducts/Razer%20Viper%20V3%20Pro/img-7_cqf6wz.jpg",
    "https://res.cloudinary.com/programming-night/image/upload/v1734184598/E-Shop/Porducts/Bose%20QuietComfort/i3z7agm7voqvvxdtiolw.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.width, // Makes it square
      child: CarouselSlider(
        items: imageUrls.map((url) {
          return SizedBox.expand( // ✅ fills full space
            child: CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover, // ✅ covers without white space
            ),
          );
        }).toList(),
        options: CarouselOptions(
          viewportFraction: 1,
          enlargeCenterPage: false, // ✅ prevent zoom effect
          autoPlay: true,
          reverse: true,
          enableInfiniteScroll: false,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          onPageChanged: (index, reason) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    ),

        SizedBox(height: 4.h),
        AnimatedSmoothIndicator(
          activeIndex: currentIndex,
          count: imageUrls.length,
          effect: ExpandingDotsEffect(),
          onDotClicked: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ],
    );
  }
}
