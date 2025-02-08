import 'package:flutter/material.dart';

class Book extends StatelessWidget {
  final String coverImagePath;
  final String title;
  final String author;
  final double price;

  const Book({
    super.key,
    required this.coverImagePath,
    required this.title,
    required this.author,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.asset(
            coverImagePath,
            width: 120,
            height: 170,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'by $author',
                  style: const TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Price: LKR $price',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 219, 9, 9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
