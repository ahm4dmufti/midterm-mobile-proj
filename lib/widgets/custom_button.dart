import 'package:flutter/material.dart';

import '../app_style.dart';

// CustomButton: our own full-width button.
// We use it on the Login and Sign up pages so all buttons look the same.
class CustomButton extends StatelessWidget {
  // The words written on the button.
  final String text;

  // The function that runs when the user taps the button.
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // SizedBox makes the button take the full width and a fixed height.
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        // The button style: our main color, white text, rounded corners.
        style: ElevatedButton.styleFrom(
          backgroundColor: mainColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
