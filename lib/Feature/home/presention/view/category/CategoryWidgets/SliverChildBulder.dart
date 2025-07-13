import 'package:flutter/cupertino.dart';

import 'CategoryCard.dart';

class Sliverchildbulder extends StatelessWidget {
  const Sliverchildbulder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder:(BuildContext,index) {
          return Categorycard();
        }
      
      ),
    );
  }
}
