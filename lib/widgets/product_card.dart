import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../app_style.dart';
import '../models/product.dart';

// ProductCard: one box in the Home grid with the product picture, name and price.
// The Home page makes one ProductCard for every product in the list.
class ProductCard extends StatelessWidget {
  // The product this card shows (passed through the constructor).
  final Product product;

  // What happens when the card is tapped (the Home page opens the details page).
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      // clipBehavior cuts the picture so it follows the card's rounded corners.
      clipBehavior: Clip.antiAlias,
      // InkWell makes the card tappable and shows a ripple effect.
      child: InkWell(
        onTap: onTap,
        child: Column(
          // Stretch makes the picture take the full width of the card.
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Expanded lets the picture take all the space left above the texts.
            Expanded(child: Image.asset(product.image, fit: BoxFit.cover)),
            Padding(
              padding: const EdgeInsets.all(appSpacing / 2),
              child: Column(
                // Start = left in English, right in Arabic.
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // The product name, translated with .tr().
                  Text(
                    product.nameKey.tr(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  // The price in our main color.
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(color: mainColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
