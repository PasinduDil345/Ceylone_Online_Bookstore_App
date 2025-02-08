import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(Map<String, dynamic> book) {
    final index =
        _cartItems.indexWhere((item) => item['title'] == book['title']);
    if (index == -1) {
      // If the book is not already in the cart, add it with quantity 1
      _cartItems.add({
        ...book, // Spread the book map to add all its properties
        'quantity': 1, // Set the default quantity to 1
      });
    } else {
      // If the book is already in the cart, increment the quantity
      _cartItems[index]['quantity'] += 1;
    }
    notifyListeners();
  }

  void removeFromCart(String title) {
    _cartItems.removeWhere((item) => item['title'] == title);
    notifyListeners();
  }

  void updateQuantity(String title, int delta) {
    final index = _cartItems.indexWhere((item) => item['title'] == title);
    if (index != -1) {
      // Update the quantity based on the delta
      _cartItems[index]['quantity'] += delta;
      // If quantity goes to 0 or below, remove the item from the cart
      if (_cartItems[index]['quantity'] <= 0) {
        removeFromCart(title);
      } else {
        notifyListeners();
      }
    }
  }

  double get totalPrice => _cartItems.fold(
        0,
        (total, item) => total + (item['price'] * item['quantity']),
      );
}
