import 'package:flutter/material.dart';

import '../app_style.dart';

// PageHeader: a big title with a small grey line under it.
// We use it at the top of the Login and Sign up pages.
class PageHeader extends StatelessWidget {
  // The big text, for example "Welcome back".
  final String title;

  // The small text under it, for example "Log in to continue".
  final String subtitle;

  const PageHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // The big title in our main color.
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: mainColor,
          ),
        ),
        // A small gap (half of our normal spacing).
        const SizedBox(height: appSpacing / 2),
        // The small grey subtitle.
        Text(
          subtitle,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}
