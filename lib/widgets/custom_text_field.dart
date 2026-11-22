import 'package:flutter/material.dart';

import '../app_style.dart';

// CustomTextField: our own input box with an icon and a hint.
// We use it for name, email and password on Login and Sign up.
class CustomTextField extends StatelessWidget {
  // The grey text shown inside the box before the user types.
  final String hint;

  // The small icon at the start of the box.
  final IconData icon;

  // If true, the text is hidden with dots (for passwords).
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      // Hide the text when this is a password field.
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: mainColor),
        // Normal border with rounded corners.
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        // Border when the user taps the field: thicker and in our main color.
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: mainColor, width: 2),
        ),
      ),
    );
  }
}
