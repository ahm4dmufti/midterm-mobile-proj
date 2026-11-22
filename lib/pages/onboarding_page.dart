import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../app_style.dart';
import 'login_page.dart';

// OnboardingPage: 3 intro pages made with the introduction_screen package.
// Each page has a picture, a title and a short text.
class OnboardingPage extends StatelessWidget {
  // The function from MyApp that turns dark mode on or off.
  // This page does not use it, it only passes it on to the next page.
  final ValueChanged<bool> onThemeChanged;

  const OnboardingPage({super.key, required this.onThemeChanged});

  // This function opens the Login page.
  // We call it from both the Skip button and the Done button.
  void goToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(onThemeChanged: onThemeChanged),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      // The list of our 3 pages.
      pages: [
        PageViewModel(
          title: 'onboarding1_title'.tr(),
          body: 'onboarding1_body'.tr(),
          image: Image.asset('assets/images/camels.jpg', width: 250),
        ),
        PageViewModel(
          title: 'onboarding2_title'.tr(),
          body: 'onboarding2_body'.tr(),
          image: Image.asset('assets/images/shakwa.jpg', width: 250),
        ),
        PageViewModel(
          title: 'onboarding3_title'.tr(),
          body: 'onboarding3_body'.tr(),
          image: Image.asset('assets/images/projector.jpg', width: 250),
        ),
      ],

      // Show the Skip button on the first pages.
      showSkipButton: true,
      // The texts of the three buttons (from the translation files).
      skip: Text('skip'.tr(), style: const TextStyle(color: mainColor)),
      next: Text('next'.tr(), style: const TextStyle(color: mainColor)),
      done: Text(
        'done'.tr(),
        style: const TextStyle(color: mainColor, fontWeight: FontWeight.bold),
      ),

      // What happens when the user taps Skip or Done: open the Login page.
      onSkip: () => goToLogin(context),
      onDone: () => goToLogin(context),

      // The little dots at the bottom: the current page dot is in our main color.
      dotsDecorator: const DotsDecorator(activeColor: mainColor),
    );
  }
}
