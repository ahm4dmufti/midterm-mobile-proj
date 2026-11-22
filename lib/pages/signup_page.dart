import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../app_style.dart';
import '../widgets/app_logo.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/page_header.dart';
import '../widgets/switch_page_text.dart';

// SignUpPage: the create account screen (UI only, nothing is saved).
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // An empty AppBar gives us the Back arrow automatically.
      appBar: AppBar(),
      // SingleChildScrollView lets the page scroll when the keyboard opens.
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(appSpacing),
        child: Column(
          children: [
            const AppLogo(size: 80),
            const SizedBox(height: appSpacing),

            // Title and subtitle at the top of the page.
            PageHeader(
              title: 'signup_title'.tr(),
              subtitle: 'signup_subtitle'.tr(),
            ),
            const SizedBox(height: appSpacing * 2),

            // Full name field.
            CustomTextField(hint: 'full_name'.tr(), icon: Icons.person),
            const SizedBox(height: appSpacing),

            // Email field.
            CustomTextField(hint: 'email'.tr(), icon: Icons.email),
            const SizedBox(height: appSpacing),

            // Password field (text is hidden).
            CustomTextField(
              hint: 'password'.tr(),
              icon: Icons.lock,
              isPassword: true,
            ),
            const SizedBox(height: appSpacing),

            // Confirm password field (text is hidden).
            CustomTextField(
              hint: 'confirm_password'.tr(),
              icon: Icons.lock_outline,
              isPassword: true,
            ),
            const SizedBox(height: appSpacing * 2),

            // Sign up button: goes back to the Login page with pop.
            CustomButton(
              text: 'sign_up'.tr(),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: appSpacing),

            // "Already have an account? Log in" -> goes back to Login with pop.
            SwitchPageText(
              question: 'have_account'.tr(),
              linkText: 'login'.tr(),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
