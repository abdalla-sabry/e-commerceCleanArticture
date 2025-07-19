import 'package:e_commerce_clean_arcitecture/Feature/home/domain/entities/product/productEntites.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../widget/CardItemsCustom.dart';



class Carditems extends StatelessWidget {
    Carditems({super.key,required this.onTap, required this.productEntites});
    GestureTapCallback? onTap;
   final ProductEntites? productEntites;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5.sp),
            child: productEntites!=null
                ?
                 Hero(
                   tag: 'product-${productEntites!.id}',
                   child: Carditemscustom(
                      imageUrl: productEntites!.images[0],
                      width: 57.sp,
                      hight: 72.sp,
                    ),
                 ):Padding(
                    padding:  EdgeInsets.only(top: 3.h),
                    child: Shimmer.fromColors(
                                  baseColor: Colors.grey.shade100,
                                  highlightColor: Colors.white,
                                  child: SizedBox(
                                    height: 66.sp,
                                    child: Container(
                    width: 56.sp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey,
                    ),
                                    ),
                                  ),
                                ),
                  ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 11.sp, top: 10.sp),
            child:  productEntites!=null
                ? Text(
                    productEntites!.name,
                    style:  TextStyle(fontWeight: FontWeight.w500,fontSize: 16.3.sp,),maxLines: 1,overflow:TextOverflow.ellipsis ,
                  )
                : Padding(
              padding:  EdgeInsets.only(top: 3.sp),
                  child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade100,
                      highlightColor: Colors.white,
                      child: SizedBox(
                        height: 20.sp,
                        child: Container(
                          width: 37.sp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 11.sp, top: 3.sp),
            child:  productEntites!=null
                ? Text(
                    '${productEntites!.priceTags[0].price} \$',
                    style:  TextStyle(
                      fontSize:  15.5.sp,
                      fontWeight: FontWeight.w600,
                    ),overflow: TextOverflow.ellipsis,maxLines: 1,
                  )
                : Padding(
              padding:  EdgeInsets.only(top: 3.sp),
                  child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade100,
                      highlightColor: Colors.white,
                      child: SizedBox(
                        height: 20.sp,
                        child: Container(
                          width: 48.sp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                ),
          ),
        ],
      ),
    );
  }
}
