import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../app_style.dart';
import '../widgets/app_logo.dart';
import 'onboarding_page.dart';

// SplashScreen: the first page. It shows the logo and the app name
// with a small animation, then after 3 seconds it opens the onboarding.
// It is a StatefulWidget because we need initState() to start the timer.
class SplashScreen extends StatefulWidget {
  // The function from MyApp that turns dark mode on or off.
  // This page does not use it, it only passes it on to the next page.
  final ValueChanged<bool> onThemeChanged;

  const SplashScreen({super.key, required this.onThemeChanged});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // initState runs one time, when the page first opens.
  @override
  void initState() {
    super.initState();
    // Wait 3 seconds, then go to the onboarding page.
    Future.delayed(const Duration(seconds: 3), () {
      // If the page was closed during the 3 seconds, stop here.
      if (!mounted) return;
      // pushReplacement opens the onboarding and REMOVES the splash,
      // so pressing Back later does not show the splash again.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              OnboardingPage(onThemeChanged: widget.onThemeChanged),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The whole background is our main color.
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          // Put the logo and the texts in the middle of the screen.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // The logo: fades in and grows from small to normal size.
            const AppLogo(size: 140)
                .animate()
                .fadeIn(duration: const Duration(milliseconds: 800))
                .scale(duration: const Duration(milliseconds: 800)),

            const SizedBox(height: appSpacing),

            // The app name: fades in a bit later and slides up.
            Text(
                  'app_name'.tr(),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
                .animate()
                .fadeIn(delay: const Duration(milliseconds: 500))
                .slideY(begin: 0.5),

            const SizedBox(height: appSpacing / 2),

            // The small slogan under the name: just fades in at the end.
            Text(
              'app_slogan'.tr(),
              style: const TextStyle(fontSize: 16, color: Colors.white70),
            ).animate().fadeIn(delay: const Duration(milliseconds: 1000)),
          ],
        ),
      ),
    );
  }
}
