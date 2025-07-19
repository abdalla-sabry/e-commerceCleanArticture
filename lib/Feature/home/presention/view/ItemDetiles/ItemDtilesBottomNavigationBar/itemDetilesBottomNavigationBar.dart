import 'package:e_commerce_clean_arcitecture/Feature/home/presention/mangement/product/TotolCheak/total_check_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../widget/InputFormButton.dart';



class Itemdetilesbottomnavigationbar extends StatelessWidget {
   Itemdetilesbottomnavigationbar({super.key});
num? total;
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
    return Container(
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
                 totalText                  ,
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
                    // print("test");
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
        );
  },
);
     
  }
}
