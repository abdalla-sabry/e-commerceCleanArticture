import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widget/InputFormButton.dart';
import '../../widget/searchBarTextFeild.dart';
import 'CategoryWidgets/SliverChildBulder.dart';
import 'CategoryWidgets/TextFelidCustmiseForCategoryCard.dart';

class Categoryview extends StatelessWidget {
  const Categoryview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: (MediaQuery.of(context).padding.top + 12),
        ),
        SizedBox(
          height: 11.h,
          child: TextFeildCustmiseForCategorycard(),
        ),
        Sliverchildbulder()
      ],
    ));
  }
}
