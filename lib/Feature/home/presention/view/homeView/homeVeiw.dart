import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'homeWidget/BottomNavigationBar/bottomNavigationBar.dart';
import 'homeWidget/ProductGridSection/productGrid.dart';
import 'homeWidget/SearchBarSection/searchBarSection.dart';
import 'homeWidget/TopBarSection/TopBarSectionWidget.dart';

class Homeveiw extends StatelessWidget {
  const Homeveiw({super.key});

  @override
  Widget build(BuildContext context) {
    return         CustomScrollView(
      slivers: [
        TopBarSection(),
        Searchbarsection(),
        SliverToBoxAdapter(
            child: SizedBox(height: 100.sp, child: Productgrid(),),)
      ],
    )
    ;
  }
}


