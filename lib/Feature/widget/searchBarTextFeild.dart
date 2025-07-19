
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Searchbartextfeild extends StatefulWidget {
  Searchbartextfeild({super.key, required this.hintText,required this.edgeInsetsGeometry});
  final String hintText;
final   EdgeInsetsGeometry edgeInsetsGeometry;

  @override
  State<Searchbartextfeild> createState() => _SearchbartextfeildState();
}

class _SearchbartextfeildState extends State<Searchbartextfeild> {
  String? currentText;
  final TextEditingController textEditingController = TextEditingController();
  void toClearText() {
    setState(() {
      currentText = null;
      textEditingController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      controller: textEditingController,
      onChanged: (value) {
        setState(() {
          currentText = value;
        });
      },
      onSubmitted: (value) {},
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
            top: 17.sp, right: 16.sp, left: 16.sp, bottom: 15.sp),
        prefixIcon: const Icon(Icons.search),
        suffixIcon: currentText == null
            ? null
            : IconButton(
                onPressed: () {
                  toClearText();
                },
                icon: const Icon(Icons.clear),
              ),
        hintText: "${widget.hintText}",
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.sp),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.sp),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 3.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.sp),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 3.0,
          ),
        ),
      ),
    );
  }
}
