import 'package:bookstoreapp/model/book.dart';
import 'package:bookstoreapp/screens/add_book_screen.dart';
import 'package:bookstoreapp/screens/book_details_screen.dart';
import 'package:bookstoreapp/screens/edit_book_screen.dart';
import 'package:flutter/material.dart';
import 'screens/books_home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: const BooksHomeScreen(),
      onGenerateRoute: (settings) {
        if (settings.name == '/books' || settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) => const BooksHomeScreen(),
          );
        } else if (settings.name?.startsWith('/books/') == true) {
          final id = int.tryParse(settings.name!.split('/')[2]);
          return MaterialPageRoute(
            builder: (context) => BookDetailsScreen(bookId: id!),
          );
        } else if (settings.name == '/updatebook') {
          final book = settings.arguments as Book;
          return MaterialPageRoute(
            builder: (context) => EditBookScreen(book: book),
          );
        } else if (settings.name == "/addbook") {
          return MaterialPageRoute(builder: (context) => AddBookScreen());
        }
        return null;
      },
    ),
  );
}
