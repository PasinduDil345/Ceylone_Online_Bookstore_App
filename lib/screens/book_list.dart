import 'package:flutter/material.dart';
import '../widgets/book_home.dart';
import 'book_details_page.dart';
import 'cart_page.dart';

/// Booklist widget
/// Uses the [Book] widget to display a list of books.
class BookList extends StatelessWidget {
  const BookList({super.key});

  /// Navigate to the book details page
  void navigateToBookDetails(
    BuildContext context,
    String title,
    String author,
    String coverImagePath,
    String description,
    double price,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailsPage(
          title: title,
          author: author,
          coverImagePath: coverImagePath,
          description: description,
          price: price,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ceylon Online Bookstore',
          style: TextStyle(
            color: Color.fromARGB(255, 241, 237, 237), // Set text color to white
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 4, 77, 84), // Dark blue
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 208, 132, 144), // Ensure icons are white
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            GestureDetector(
              onTap: () => navigateToBookDetails(
                context,
                'Fellowship of the Ring',
                'J.R.R Tolkien',
                'assets/images/fellowship-of-the-ring.jpg',
                'An epic journey of friendship, courage, and destiny as Frodo Baggins and his companions set out to destroy the One Ring and thwart the dark lord Sauron.',
                2500,
              ),
              child: const Book(
                coverImagePath: 'assets/images/fellowship-of-the-ring.jpg',
                title: 'Fellowship of the Ring',
                author: 'J.R.R Tolkien',
                price: 2500,
              ),
            ),
            GestureDetector(
              onTap: () => navigateToBookDetails(
                context,
                'The Witcher Last Wish',
                'Andrzej Sapkowski',
                'assets/images/witcher-the-last-wish.jpg',
                'A captivating fantasy adventure following Geralt of Rivia, a monster hunter for hire, as he navigates a world of magic, destiny, and moral dilemmas through a series of interconnected short stories.',
                2000,
              ),
              child: const Book(
                coverImagePath: 'assets/images/witcher-the-last-wish.jpg',
                title: 'The Witcher Last Wish',
                author: 'Andrzej Sapkowski',
                price: 2000,
              ),
            ),
        
            GestureDetector(
              onTap: () => navigateToBookDetails(
                context,
                'Harry Potter and the Goblet of Fire',
                'J. K. Rowling',
                'assets/images/goblet-of-fire.jpg',
                'A thrilling tale of magic, mystery, and danger as Harry Potter competes in the deadly Triwizard Tournament while uncovering a dark conspiracy that threatens the wizarding world.',
                3200,
              ),
              child: const Book(
                coverImagePath: 'assets/images/goblet-of-fire.jpg',
                title: 'Harry Potter and the Goblet of Fire',
                author: 'J.K. Rowling',
                price: 3200,
              ),
            ),
            GestureDetector(
              onTap: () => navigateToBookDetails(
                context,
                'The Da Vinci Code',
                'Dan Brown',
                'assets/images/the-davinci-code.jpg',
                'A fast-paced thriller about secret societies, hidden codes, and a race against time to uncover a hidden truth that could change history.',
                2000,
              ),
              child: const Book(
                coverImagePath: 'assets/images/the-davinci-code.jpg',
                title: 'The Da Vinci Code',
                author: 'Dan Brown',
                price: 2000,
              ),
            ),
            GestureDetector(
              onTap: () => navigateToBookDetails(
                context,
                'Tarzan of the Apes',
                'Edgar Rice Burroughs',
                'assets/images/tarzen-the-apes.jpg',
                'A gripping tale of survival, identity, and adventure as a boy raised by apes discovers his true heritage and battles for his place in both the jungle and civilization.',
                900,
              ),
              child: const Book(
                coverImagePath: 'assets/images/tarzen-the-apes.jpg',
                title: 'Tarzan of the Apes',
                author: 'Edgar Rice Burroughs',
                price: 900,
              ),
            ),
        
        
        GestureDetector(
              onTap: () => navigateToBookDetails(
                context,
                'Percy Jackson and the Olympians The Sea of Monsters',
                'Rick Riordan',
                'assets/images/sea-of-monsters.jpg',
                'A thrilling adventure about friendship, courage, and a perilous quest through the Sea of Monsters to save Camp Half-Blood.',
                1700,
              ),
              child: const Book(
                coverImagePath: 'assets/images/sea-of-monsters.jpg',
                title: 'Percy Jackson and the Olympians The Sea of Monsters',
                author: 'Rick Riordan',
                price: 1700,
              ),
            ),
        
        
          ],
        ),
      ),
    );
  }
}
