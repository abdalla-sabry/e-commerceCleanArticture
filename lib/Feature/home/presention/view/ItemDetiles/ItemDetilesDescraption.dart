import 'package:e_commerce_clean_arcitecture/Feature/home/domain/entities/product/productEntites.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'widget/ContainerPriseandColor.dart';

class Itemdetilesdescraption extends StatefulWidget {
  Itemdetilesdescraption({super.key, required this.product});
  ProductEntites product;

  @override
  State<Itemdetilesdescraption> createState() => _ItemdetilesdescraptionState();
}

class _ItemdetilesdescraptionState extends State<Itemdetilesdescraption> {
  int selectedIndex=0;

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(left: 4.w),
          child: SizedBox(
            height: 7.5.h,
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 3.w,
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: widget.product.priceTags.length,
                itemBuilder: (context, index) {
                  return ContainerPriseandColor(
                    title: '${widget.product.priceTags[index].name}',
                    price: widget.product.priceTags[index].price,
                    isSelected: selectedIndex==index,
                    onTap: () {
                      selectedIndex=index;
                      setState(() {

                      });
                    },
                  );
                }),
          ),
        ),
      ],
    ));
  }
}
