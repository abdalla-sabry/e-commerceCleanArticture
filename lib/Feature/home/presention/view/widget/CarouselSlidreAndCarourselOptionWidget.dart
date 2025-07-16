import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/domain/entities/product/productEntites.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Carouselslidreandcarourseloptionwidget extends StatefulWidget {
  const Carouselslidreandcarourseloptionwidget({super.key, required this.productEntites});

  final ProductEntites productEntites;

  @override
  State<Carouselslidreandcarourseloptionwidget> createState() =>
      _Carouselslidreandcarourseloptionwidget();
}

class _Carouselslidreandcarourseloptionwidget
    extends State<Carouselslidreandcarourseloptionwidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final product = widget.productEntites;

    return Column(
      children: [
        // ✅ Force a square aspect ratio
        AspectRatio(
          aspectRatio: 1, // Square
          child: CarouselSlider.builder(
            itemCount: product.images.length,
            itemBuilder: (context, index, realIdx) {
              final image = product.images[index];

              return Hero(
                tag: 'product-${product.id}',
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white, // match theme
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(image),
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                  ),

                ),
              );
            },
            options: CarouselOptions(
              viewportFraction: 1,
              enlargeCenterPage: false,
              enableInfiniteScroll: false,
              height: double.infinity, // Will be controlled by AspectRatio
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ),

        SizedBox(height: 2.h),

        // ✅ Dot indicator
        AnimatedSmoothIndicator(
          activeIndex: currentIndex,
          count: product.images.length,
          effect: ExpandingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotColor: Colors.black,
            dotColor: Colors.grey.shade300,
          ),
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
