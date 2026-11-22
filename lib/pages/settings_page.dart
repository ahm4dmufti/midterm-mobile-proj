import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../app_style.dart';
import '../widgets/custom_button.dart';

// SettingsPage: a dark mode switch and Arabic / English buttons.
class SettingsPage extends StatelessWidget {
  // The function from MyApp that turns dark mode on (true) or off (false).
  // It came down through the constructors: MyApp -> Splash -> Onboarding -> Login -> Home -> here.
  final ValueChanged<bool> onThemeChanged;

  const SettingsPage({super.key, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    // Is the app dark right now? We ask the current theme.
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: Text('settings'.tr())),
      body: Padding(
        padding: const EdgeInsets.all(appSpacing),
        child: Column(
          children: [
            // ----- Dark mode -----
            Card(
              // SwitchListTile = a row with an icon, a title and a switch.
              child: SwitchListTile(
                secondary: const Icon(Icons.dark_mode, color: mainColor),
                title: Text('dark_mode'.tr()),
                activeThumbColor: mainColor,
                // The switch is ON when the app is dark.
                value: isDark,
                // When the user flips the switch, tell MyApp the new value.
                // MyApp calls setState and the whole app changes theme.
                onChanged: (value) {
                  onThemeChanged(value);
                },
              ),
            ),
            const SizedBox(height: appSpacing),

            // ----- Language -----
            Card(
              child: Padding(
                padding: const EdgeInsets.all(appSpacing),
                child: Column(
                  children: [
                    // A row with the language icon and the word "Language".
                    Row(
                      children: [
                        const Icon(Icons.language, color: mainColor),
                        const SizedBox(width: appSpacing),
                        Text(
                          'language'.tr(),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: appSpacing),
                    // The two language buttons next to each other.
                    Row(
                      children: [
                        // Expanded gives each button half of the width.
                        Expanded(
                          child: CustomButton(
                            text: 'english'.tr(),
                            // setLocale changes the language of the whole app.
                            onPressed: () {
                              context.setLocale(const Locale('en'));
                            },
                          ),
                        ),
                        const SizedBox(width: appSpacing),
                        Expanded(
                          child: CustomButton(
                            text: 'arabic'.tr(),
                            // Arabic also flips the layout to right-to-left.
                            onPressed: () {
                              context.setLocale(const Locale('ar'));
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
