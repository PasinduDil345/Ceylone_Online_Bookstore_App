import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Cart',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 147, 5, 61),
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the back button color to white
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cart.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cart.cartItems[index];
                  return ListTile(
                    leading: Image.asset(item['coverImagePath'], height: 50),
                    title: Text(item['title']),
                    subtitle:
                        Text('LKR ${item['price']} x ${item['quantity']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            // Decrement quantity with bounds check (1 to 99)
                            if (item['quantity'] > 1) {
                              cart.updateQuantity(item['title'], -1);
                            }
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            // Increment quantity with bounds check (1 to 99)
                            if (item['quantity'] < 99) {
                              cart.updateQuantity(item['title'], 1);
                            }
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => cart.removeFromCart(item['title']),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Total: LKR ${cart.totalPrice}',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Purchase logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Purchase Successful')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 166, 25, 12), // Button color
                    ),
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)), // White text
                    ),
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
