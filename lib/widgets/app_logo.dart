import 'package:flutter/material.dart';

// AppLogo: shows the shop logo picture.
// We use it on the Splash, Login and Sign up pages.
class AppLogo extends StatelessWidget {
  // How big the logo is (width and height).
  final double size;

  const AppLogo({super.key, this.size = 100});

  @override
  Widget build(BuildContext context) {
    // ClipRRect rounds the corners of the logo picture,
    // because the logo has a white background (it is a .jpg).
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      // Load the logo from the assets/images folder.
      child: Image.asset('assets/images/logo.jpg', width: size, height: size),
    );
  }
}
