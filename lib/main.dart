import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'app_style.dart';
import 'pages/splash_screen.dart';

// main() is the first function that runs when the app starts.
// It is "async" because we must wait for the translations to load.
void main() async {
  // Make sure Flutter is ready before we do any setup.
  WidgetsFlutterBinding.ensureInitialized();
  // Load the easy_localization package (Arabic / English).
  await EasyLocalization.ensureInitialized();

  runApp(
    // EasyLocalization wraps the whole app so every page can use .tr().
    EasyLocalization(
      // The two languages our app supports.
      supportedLocales: const [Locale('en'), Locale('ar')],
      // The folder where en.json and ar.json are.
      path: 'assets/translations',
      // If something goes wrong, use English.
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

// MyApp: the root widget of the app. It sets the theme, language and first page.
// It is a StatefulWidget because it remembers if dark mode is on (isDark).
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // false = light mode, true = dark mode. The app starts in light mode.
  bool isDark = false;

  // This function changes the theme. We pass it down to the Settings page.
  // setState tells Flutter to run build() again, so MaterialApp gets the new themeMode.
  void changeTheme(bool value) {
    setState(() {
      isDark = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the red "DEBUG" banner in the corner.
      debugShowCheckedModeBanner: false,
      title: 'app_name'.tr(),
      // These 3 lines connect MaterialApp to easy_localization,
      // so the app knows the current language and flips to right-to-left for Arabic.
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // The light theme: all default colors are made from our one main color.
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: mainColor)),
      // The dark theme: the same main color, but with dark backgrounds.
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: mainColor,
          brightness: Brightness.dark,
        ),
      ),
      // Which of the two themes to use, based on isDark.
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      // The first page that opens. We give it the changeTheme function
      // so it can pass it on until it reaches the Settings page.
      home: SplashScreen(onThemeChanged: changeTheme),
    );
  }
}
