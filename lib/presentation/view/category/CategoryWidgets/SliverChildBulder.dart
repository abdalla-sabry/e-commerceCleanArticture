import 'package:e_commerce_clean_arcitecture/presentation/view/category/CategoryWidgets/CategoryCard.dart';
import 'package:flutter/cupertino.dart';

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
