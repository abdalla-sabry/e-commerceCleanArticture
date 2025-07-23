import 'package:e_commerce_clean_arcitecture/Feature/home/presention/mangement/CardItem/GetCardItems/get_card_items_cubit.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/presention/view/card/CardItem.dart';
import 'package:e_commerce_clean_arcitecture/Feature/widget/snackBarText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sizer/sizer.dart';
import '../../../data/Models/cart/CartModel.dart';
class Listviewcarditem extends StatelessWidget {
  Listviewcarditem({super.key});
  @override
  List<ProductCardModel>productCardModelList=[];
  Widget build(BuildContext context) {
    return BlocBuilder<GetCardItemsCubit, GetCardItemsState>(
      builder: (context, state) {
       if (state is GetCardItemsFailure) {
          SnackBarText.show(context: context, message: state.error);
          return const SizedBox();
        } else if (state is GetCardItemsSuccess) {
           productCardModelList = state.productCardList;

          if (productCardModelList.isEmpty) {
            return const SizedBox(height: 10);
          }
           context.loaderOverlay.show();

          return LoaderOverlay(
            child: SizedBox(
              height: 69.h,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                 return SizedBox(height: 1.h,);
                },
                itemCount: productCardModelList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Carditem(
                    productCardModel: productCardModelList[index],
                  );
                },
              ),
            ),
          );
        } else {

         context.loaderOverlay.hide();

         if (productCardModelList.isEmpty) {
           return const SizedBox(height: 10);
         }

         return LoaderOverlay(
           child: SizedBox(
             height: 69.h,
             child: ListView.separated(
               separatorBuilder: (context, index) {
                 return SizedBox(height: 1.h,);
               },
               itemCount: productCardModelList.length,
               itemBuilder: (BuildContext context, int index) {
                 return Carditem(
                   productCardModel: productCardModelList[index],
                 );
               },
             ),
           ),
         );
        }
      },
    );
  }
}
