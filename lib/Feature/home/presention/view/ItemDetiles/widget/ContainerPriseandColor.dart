import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart'; // For responsive sizing

class ContainerPriseandColor extends StatelessWidget {
  final String title;  // e.g., "Black"
  final double price;  // e.g., 151.99
  final bool isSelected;
  final VoidCallback onTap;

  const ContainerPriseandColor({
    super.key,
    required this.title,
    required this.price,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 15.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.grey.shade700 : Colors.grey.shade400,
            width: isSelected ? 2 : 1.2,
          ),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: .5.h),

            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: .5.h),
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
