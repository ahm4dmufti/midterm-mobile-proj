import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../app_style.dart';
import '../models/product.dart';

// ProductDetailsPage: shows one product with a big picture, name, price and description.
// The product comes from the Home page through the constructor.
class ProductDetailsPage extends StatelessWidget {
  // The product to show.
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The AppBar shows the product name and gives us the Back arrow.
      appBar: AppBar(title: Text(product.nameKey.tr())),
      // SingleChildScrollView lets the page scroll if the description is long.
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(appSpacing),
        child: Column(
          // Start = left in English, right in Arabic.
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // The big picture with rounded corners.
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                product.image,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: appSpacing),

            // The product name.
            Text(
              product.nameKey.tr(),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: appSpacing / 2),

            // The price in our main color.
            Text(
              '\$${product.price}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: mainColor,
              ),
            ),
            const SizedBox(height: appSpacing),

            // A small "Description" heading.
            Text(
              'description'.tr(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: appSpacing / 2),

            // The long description text.
            Text(
              product.descriptionKey.tr(),
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
