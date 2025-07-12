import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

abstract class styleText {
  //i order ai to creata it


// Main title like "Welcome,"
 static final TextStyle TitleTextStyle = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    letterSpacing: -0.5,
  );

// Subheading like "E-Shop mobile store"
  static  final TextStyle SubTitleTextStyle = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

// Search bar hint like "Search Product"
  static final TextStyle SearchTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Colors.grey[600],
  );

// Product name like "Razer Viper V3 Pro"
  static  final TextStyle ProductNameTextStyle = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

// Product price like "$151.99"
  static  final TextStyle PriceTextStyle = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

// Selected nav label like "Home"
  static  final TextStyle NavSelectedTextStyle = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Colors.redAccent,
  );

// Unselected nav label
  static  final TextStyle NavUnselectedTextStyle = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.grey[600],
  );

}
