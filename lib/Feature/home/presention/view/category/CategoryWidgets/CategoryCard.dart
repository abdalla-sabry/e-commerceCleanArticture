import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/domain/entities/catigory/catigory.dart';
import 'package:e_commerce_clean_arcitecture/core/utiles/fontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Categorycard extends StatelessWidget {
   Categorycard({super.key,required this.categoryEntites});
CategoryEntites categoryEntites;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h, right: 5.w, left: 5.w),
      child: RefreshIndicator(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 19.h,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: Offset(0, 1),
                    blurRadius: 6,
                    spreadRadius: 0,
                  )
                ],
              ),
              clipBehavior: Clip. hardEdge,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl:categoryEntites.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 2.h,
              right: 3.w,
              child: Container(

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    child: Text(
                      categoryEntites.name,
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        onRefresh: () async {},
      ),
    );
  }
}
