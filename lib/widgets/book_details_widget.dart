import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';
import '../screens/cart_page.dart';

/// A widget to display the detailed view of a book.
class BookDetailsWidget extends StatelessWidget {
  final String title;
  final String author;
  final String coverImagePath;
  final String description;
  final double price;

  const BookDetailsWidget({
    super.key,
    required this.title,
    required this.author,
    required this.coverImagePath,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);
    bool isInCart = cart.cartItems.any((item) => item['title'] == title);

    return Column(
      children: [
        Column(
          children: [
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'by $author',
              style: const TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Image.asset(
              coverImagePath,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                description,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Price: LKR $price',
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 132, 13, 13),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (isInCart) {
                    // If already in cart, navigate to the cart page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CartPage()),
                    );
                  } else {
                    // Add to cart functionality using Provider
                    cart.addToCart({
                      'title': title,
                      'author': author,
                      'coverImagePath': coverImagePath,
                      'price': price,
                    });

                    // Show a SnackBar to confirm the addition
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$title added to cart!'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 202, 57, 20), // Dark blue
                ),
                child: Text(
                  isInCart ? 'In Cart' : 'Add to Cart',
                  style: const TextStyle(color: Color.fromARGB(255, 251, 251, 251)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20), // Add some spacing at the bottom
      ],
    );
  }
}
