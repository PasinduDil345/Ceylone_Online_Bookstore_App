import 'package:flutter/material.dart';
import '../widgets/book_details_widget.dart';

/// Displays the details of a book in a detailed view.
class BookDetailsPage extends StatelessWidget {
  final String title;
  final String author;
  final String coverImagePath;
  final String description;
  final double price;

  const BookDetailsPage({
    super.key,
    required this.title,
    required this.author,
    required this.coverImagePath,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Book Information',
          style: TextStyle(
            color: Color.fromARGB(255, 11, 2, 2), // Set text color to white
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 158, 124, 22), // Dark blue
        iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 1, 24, 23)), // Ensure back button icons are white
      ),
      body: SafeArea(
        child: BookDetailsWidget(
          title: title,
          author: author,
          coverImagePath: coverImagePath,
          description: description,
          price: price,
        ),
      ),
    );
  }
}
