import 'package:flutter/material.dart';

import '../app_style.dart';

// SwitchPageText: a line like "Don't have an account? Sign up".
// The first part is normal text, the second part is a link you can tap.
// We use it at the bottom of the Login and Sign up pages.
class SwitchPageText extends StatelessWidget {
  // The normal text, for example "Don't have an account?".
  final String question;

  // The text of the link, for example "Sign up".
  final String linkText;

  // What happens when the link is tapped (we navigate to another page).
  final VoidCallback onTap;

  const SwitchPageText({
    super.key,
    required this.question,
    required this.linkText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Wrap puts the two parts next to each other, centered.
    // It is like a Row, but if the screen is too narrow it moves
    // the link to the next line instead of overflowing.
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(question),
        // TextButton is a button that looks like a text link.
        TextButton(
          onPressed: onTap,
          child: Text(
            linkText,
            style: const TextStyle(
              color: mainColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
