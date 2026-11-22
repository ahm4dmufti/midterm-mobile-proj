import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../app_style.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import 'product_details_page.dart';
import 'settings_page.dart';

// HomePage: shows all the products in a grid with 2 columns.
class HomePage extends StatelessWidget {
  // The function from MyApp that turns dark mode on or off.
  // Home does not use it, it only passes it on to the Settings page.
  final ValueChanged<bool> onThemeChanged;

  const HomePage({super.key, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app_name'.tr()),
        // actions = the buttons on the side of the app bar.
        actions: [
          // The settings icon: opens the Settings page.
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SettingsPage(onThemeChanged: onThemeChanged),
                ),
              );
            },
          ),
        ],
      ),
      // GridView.builder builds one card for each product in the list.
      body: GridView.builder(
        padding: const EdgeInsets.all(appSpacing),
        // How many cards there are: the length of our products list.
        itemCount: products.length,
        // The grid layout: 2 columns, our spacing between cards,
        // and each card is a bit taller than it is wide (0.75).
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: appSpacing,
          mainAxisSpacing: appSpacing,
          childAspectRatio: 0.75,
        ),
        // itemBuilder runs once for each card. "index" is 0, 1, 2 ...
        itemBuilder: (context, index) {
          return ProductCard(
            product: products[index],
            // Tapping a card opens the details page with THAT product.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailsPage(product: products[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
