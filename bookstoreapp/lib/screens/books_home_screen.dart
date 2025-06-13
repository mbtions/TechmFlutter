import 'package:bookstoreapp/model/book.dart';
import 'package:bookstoreapp/screens/add_book_screen.dart';
import 'package:bookstoreapp/screens/book_details_screen.dart';
import 'package:bookstoreapp/screens/edit_book_screen.dart';
import 'package:bookstoreapp/services/book_remote_services.dart';
import 'package:bookstoreapp/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class BooksHomeScreen extends StatefulWidget {
  const BooksHomeScreen({super.key});

  @override
  State<BooksHomeScreen> createState() => BooksHomeScreenState();
}

class BooksHomeScreenState extends State<BooksHomeScreen> {
  List<Book>? allBooks = [];
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    allBooks = await BookRemoteServices().getAllBooks();
    if (allBooks != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Books')),
      body: RefreshIndicator(
        onRefresh: () async {
          await getData();
        },
        child: Visibility(
          visible: isLoaded,
          replacement: Center(child: CircularProgressIndicator()),
          child: ListView.builder(
            itemCount: allBooks!.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      BookDetailsScreen(bookId: allBooks![index].id!),
                ),
              ),
              child: BookCard(book: allBooks![index]),
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Edit Book Screen
          // Navigator.pushNamed(context, '/editBook');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddBookScreen()),
          );
        },
        tooltip: 'Add Book',
        child: Icon(Icons.add),
      ),
    );
  }
}
