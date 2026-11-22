import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../app_style.dart';
import '../widgets/app_logo.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/page_header.dart';
import '../widgets/switch_page_text.dart';
import 'home_page.dart';
import 'signup_page.dart';

// LoginPage: the log in screen (UI only, there is no real login).
class LoginPage extends StatelessWidget {
  // The function from MyApp that turns dark mode on or off.
  // This page does not use it, it only passes it on to the next page.
  final ValueChanged<bool> onThemeChanged;

  const LoginPage({super.key, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea keeps our content away from the phone's notch and status bar.
      body: SafeArea(
        // SingleChildScrollView lets the page scroll when the keyboard opens.
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(appSpacing),
          child: Column(
            children: [
              const SizedBox(height: appSpacing * 2),
              const AppLogo(),
              const SizedBox(height: appSpacing),

              // Title and subtitle at the top of the page.
              PageHeader(
                title: 'login_title'.tr(),
                subtitle: 'login_subtitle'.tr(),
              ),
              const SizedBox(height: appSpacing * 2),

              // Email field.
              CustomTextField(hint: 'email'.tr(), icon: Icons.email),
              const SizedBox(height: appSpacing),

              // Password field (text is hidden).
              CustomTextField(
                hint: 'password'.tr(),
                icon: Icons.lock,
                isPassword: true,
              ),
              const SizedBox(height: appSpacing * 2),

              // Log in button.
              CustomButton(
                text: 'login'.tr(),
                // No real login: the button just opens the Home page.
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          HomePage(onThemeChanged: onThemeChanged),
                    ),
                  );
                },
              ),
              const SizedBox(height: appSpacing),

              // "Don't have an account? Sign up" -> opens the Sign up page.
              SwitchPageText(
                question: 'no_account'.tr(),
                linkText: 'sign_up'.tr(),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
