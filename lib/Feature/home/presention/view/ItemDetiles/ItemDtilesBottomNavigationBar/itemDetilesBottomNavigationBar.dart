import 'package:e_commerce_clean_arcitecture/Feature/home/data/Models/cart/CartModel.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/domain/entities/product/productEntites.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/presention/mangement/CardItem/addCardItems/add_card_items_cubit.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/presention/mangement/product/TotolCheak/total_check_cubit.dart';
import 'package:e_commerce_clean_arcitecture/Feature/widget/snackBarText.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../../widget/InputFormButton.dart';

class Itemdetilesbottomnavigationbar extends StatelessWidget {
  Itemdetilesbottomnavigationbar({super.key, required this.productEntites});
  num? total;

  ProductEntites productEntites;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TotalCheckCubit, TotalCheckState>(
      builder: (context, state) {
        String totalText;

        if (state is TotalCheckInitial) {
          totalText = '\$0';
        } else if (state is TotalCheckAdding) {
          totalText = '\$${state.addPrise}';
        } else {
          totalText = '...'; // optional fallback
        }
        return BlocListener<AddCardItemsCubit, AddCardItemsState>(
          listener: (context, state) {
            if (state is AddCardItemsSuccess) {
              context.loaderOverlay.hide();

              SnackBarText.show(context: context, message: state.massage);
            } else if (state is AddCardItemsFailure) {
              SnackBarText.show(context: context, message: state.error!);
              context.loaderOverlay.hide();
            } else {
              context.loaderOverlay.show();
            }
          },
          child: LoaderOverlay(
            child: Container(
              color: Theme.of(context).colorScheme.secondary,
              height: 80 + MediaQuery.of(context).padding.bottom,
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 10,
                top: 10,
                left: 20,
                right: 20,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      Text(
                        totalText,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 120,
                    child: InputFormButton(
                      color: Color(0xffA18F8F),
                      onClick: () {
                        var uid = FirebaseAuth.instance.currentUser!.uid;
                        BlocProvider.of<AddCardItemsCubit>(context)
                            .addProductToCart(
                                product: ProductCardModel(
                                    name: productEntites.name,
                                    type: productEntites.categories[0].name,
                                    price: productEntites.priceTags[0].price,
                                    imageUrl: productEntites.images[0]),
                                uid: uid);
                        Navigator.pop(context);
                      },
                      titleText: "Add to Cart",
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  SizedBox(
                    width: 90,
                    child: InputFormButton(
                      color: Color(0xffA18F8F),
                      onClick: () {},
                      titleText: "Buy",
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
