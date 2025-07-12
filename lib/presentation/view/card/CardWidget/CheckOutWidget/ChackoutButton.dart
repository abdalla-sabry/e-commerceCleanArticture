import 'package:flutter/material.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add your action here
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Makes it pill-shaped
        ),
        elevation: 4,
      ),
      child: const Text(
        'Checkout',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
