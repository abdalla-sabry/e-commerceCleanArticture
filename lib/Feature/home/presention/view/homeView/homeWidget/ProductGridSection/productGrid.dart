import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/presention/mangement/product/ListProducts/product_list_cubit.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/presention/view/homeView/homeWidget/ProductGridSection/ProductGridAtLoading.dart';
import 'package:e_commerce_clean_arcitecture/core/utiles/fontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../ItemDetiles/ItemDetilesView.dart';
import 'ProductGradAtSuccess.dart';
import 'cardItems.dart';

class Productgrid extends StatelessWidget {
  const Productgrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 18.sp, left: 18.sp, top: 4.sp),
      child: RefreshIndicator(

        onRefresh: () async {},
        child:  BlocBuilder<ProductListCubit, ProductListState>(
          builder: (context, state) {
            if(state is ProductListLoading ||state is ProductListInitial){
              return Productgridatloading();
            }else if (state is ProductListSuccess){
              return Productgradatsuccess( productList: state.productList,);

            }else if(state is ProductListFailer){
              return Text(state.error);
            }else { return Text('6');}
          },
        ),
      ),
    );
  }
}
