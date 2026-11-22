// Product: a simple class that holds the data of one product.
class Product {
  // The translation key of the name, for example 'product_clock_name'.
  // We store the KEY (not the text) so the name can be shown in English or Arabic.
  final String nameKey;

  // The translation key of the long description.
  final String descriptionKey;

  // The price in dollars.
  final int price;

  // The path of the product picture inside assets/images.
  final String image;

  const Product({
    required this.nameKey,
    required this.descriptionKey,
    required this.price,
    required this.image,
  });
}

// A plain list with all the products of the shop.
// The Home page reads this list to build the grid.
const List<Product> products = [
  Product(
    nameKey: 'product_camels_name',
    descriptionKey: 'product_camels_desc',
    price: 60,
    image: 'assets/images/camels.jpg',
  ),
  Product(
    nameKey: 'product_projector_name',
    descriptionKey: 'product_projector_desc',
    price: 350,
    image: 'assets/images/projector.jpg',
  ),
  Product(
    nameKey: 'product_shakwa_name',
    descriptionKey: 'product_shakwa_desc',
    price: 150,
    image: 'assets/images/shakwa.jpg',
  ),
  Product(
    nameKey: 'product_clock_name',
    descriptionKey: 'product_clock_desc',
    price: 250,
    image: 'assets/images/clock.png',
  ),
  Product(
    nameKey: 'product_painting_name',
    descriptionKey: 'product_painting_desc',
    price: 400,
    image: 'assets/images/painting.png',
  ),
  Product(
    nameKey: 'product_lamp_name',
    descriptionKey: 'product_lamp_desc',
    price: 120,
    image: 'assets/images/lamp.png',
  ),
];
