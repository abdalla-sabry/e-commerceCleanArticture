import 'package:flutter/cupertino.dart';

import 'cardItems.dart';

class Productgridatloading extends StatelessWidget {
  const Productgridatloading({super.key});

  @override
  Widget build(BuildContext context) {
              return GridView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: 16,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.55,
        crossAxisSpacing: 6,
        mainAxisSpacing: 4,
      ),
      itemBuilder: (context, index) {
        return Carditems(onTap: () {
        }, productEntites: null,);
      },
    );
  }
}
