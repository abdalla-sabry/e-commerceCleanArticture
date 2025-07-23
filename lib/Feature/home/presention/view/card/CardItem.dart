import 'package:e_commerce_clean_arcitecture/Feature/home/data/Models/cart/CartModel.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/presention/mangement/CardItem/GetCardItems/get_card_items_cubit.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/presention/mangement/CardItem/RemoveCardItems/remove_card_items_cubit.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/presention/mangement/product/TotolCheak/total_check_cubit.dart';
import 'package:e_commerce_clean_arcitecture/core/utiles/fontStyle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../../widget/CardItemsCustom.dart';
import '../../mangement/CardItem/totilePrice/totile_prices_cubit.dart';

class Carditem extends StatelessWidget {
  Carditem({super.key, required this.productCardModel});
  bool isLoading = true;
  ProductCardModel productCardModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Carditemscustom(
          hight: 20.h,
          width: 27.w,
          imageUrl: productCardModel.imageUrl,
        ),
        Container(
          width: 45.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 15.sp,
                ),
                child: isLoading
                    ? Text(
                        productCardModel.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17.sp),
                      )
                    : Shimmer.fromColors(
                        baseColor: Colors.grey.shade100,
                        highlightColor: Colors.white,
                        child: SizedBox(
                          height: 17.sp,
                          child: Container(
                            width: 34.sp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.sp, top: 11.sp),
                child: isLoading
                    ? Text(
                        '\$${productCardModel.price}',
                        style: TextStyle(
                          fontSize: 16.5.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    : Shimmer.fromColors(
                        baseColor: Colors.grey.shade100,
                        highlightColor: Colors.white,
                        child: SizedBox(
                          height: 17.sp,
                          child: Container(
                            width: 44.sp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: (){
              final uid = FirebaseAuth.instance.currentUser!.uid;
              BlocProvider.of<RemoveCardItemsCubit>(context).removeCardItem(uid: uid, productId: productCardModel.id);
              BlocProvider.of<GetCardItemsCubit>(context).fetchCardProducts(uid: uid);
              BlocProvider.of<TotilePricesCubit>(context). subtractFromTotalPrice(uid,productCardModel.price );

            },
          )
        )
      ],
    );
  }
}
