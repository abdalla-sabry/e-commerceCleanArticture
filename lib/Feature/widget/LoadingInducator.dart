import 'package:e_commerce_clean_arcitecture/core/utiles/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: _GlowingSpinnerWithText(),
      ),

    );
  }
}

class _GlowingSpinnerWithText extends StatefulWidget {
  const _GlowingSpinnerWithText();

  @override
  State<_GlowingSpinnerWithText> createState() => _GlowingSpinnerWithTextState();
}

class _GlowingSpinnerWithTextState extends State<_GlowingSpinnerWithText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat();
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 30.h,
        ),
      Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(2, 4),
          )
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: CircularProgressIndicator(
          strokeWidth: 3.5,
          color: Colors.black,
        ),
      ),
    ),
        const SizedBox(height: 20),
        const Text(
          "Loading...",
          style: TextStyle(
            color: Colors.white70,
            fontSize: 18,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
