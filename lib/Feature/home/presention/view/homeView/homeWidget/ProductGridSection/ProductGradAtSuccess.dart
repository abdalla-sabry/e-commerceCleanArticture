import 'package:e_commerce_clean_arcitecture/Feature/home/domain/entities/product/productEntites.dart';
import 'package:flutter/cupertino.dart';

import 'cardItems.dart';

class Productgradatsuccess extends StatelessWidget {
   Productgradatsuccess({super.key, required this.productList});
final List <ProductEntites>productList;
  @override
  Widget build(BuildContext context) {
                 return GridView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: productList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.55,
        crossAxisSpacing: 6,
        mainAxisSpacing: 4,
      ),
      itemBuilder: (context, index) {
        return Hero(
          tag: 'productItem',
          child: Carditems(onTap: () {

          }, productEntites: productList[index],),
        );
      },
    );

  }
}
