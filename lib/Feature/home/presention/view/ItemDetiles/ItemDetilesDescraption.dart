import 'package:e_commerce_clean_arcitecture/Feature/home/domain/entities/product/productEntites.dart';
import 'package:e_commerce_clean_arcitecture/Feature/home/presention/mangement/product/TotolCheak/total_check_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'widget/ContainerPriseandColor.dart';

class Itemdetilesdescraption extends StatefulWidget {
  Itemdetilesdescraption({super.key, required this.product});
  ProductEntites product;

  @override
  State<Itemdetilesdescraption> createState() => _ItemdetilesdescraptionState();
}

class _ItemdetilesdescraptionState extends State<Itemdetilesdescraption> {
  int selectedIndex = 0;

  bool isVisible = false;
  getIntialPrice() {
    BlocProvider.of<TotalCheckCubit>(context)
        .addPrice(widget.product.priceTags[0].price);
  }

  @override
  void initState() {
    // TODO: implement initState
    getIntialPrice();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: .5.h),
      child: Column(
        children: [
          Text(
            widget.product.name,
            style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 7.5.h,
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 1.5.w,
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: widget.product.priceTags.length,
                itemBuilder: (context, index) {
                  return ContainerPriseandColor(
                    title: '${widget.product.priceTags[index].name}',
                    price: widget.product.priceTags[index].price,
                    isSelected: selectedIndex == index,
                    onTap: () {
                      selectedIndex = index;
                      setState(() {
                        BlocProvider.of<TotalCheckCubit>(context)
                            .addPrice(widget.product.priceTags[index].price);
                      });
                    },
                  );
                }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            child: Text(
              widget.product.description,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp),
            ),
          )
        ],
      ),
    ));
  }
}
