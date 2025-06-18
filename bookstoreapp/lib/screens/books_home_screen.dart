import 'package:bookstoreapp/services/book_remote_services.dart';
import 'package:bookstoreapp/widgets/book_card.dart';
import 'package:bookstoreapp/model/book.dart';
import 'package:flutter/material.dart';

// FETCH ALL BOOKS ON HOME SCREEN (GET REQUEST)
class BooksHomeScreen extends StatefulWidget {
  const BooksHomeScreen({super.key});

  @override
  State<BooksHomeScreen> createState() => BooksHomeScreenState();
}

class BooksHomeScreenState extends State<BooksHomeScreen> {
  List<Book> allBooks = [];
  List<Book> filteredBooks = [];
  bool isLoaded = false;

  final TextEditingController _searchController = TextEditingController();
  bool _showSearch = false;

  void _toggleSearch() {
    setState(() {
      _showSearch = !_showSearch;
      _searchController.clear();
      filteredBooks = List.from(allBooks);
    });
  }

  void searchBookByTitle(String value) {
    setState(() {
      filteredBooks = allBooks
          .where(
            (book) => book.title.toLowerCase().contains(value.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final books = await BookRemoteServices().getAllBooks();
    if (books != null) {
      setState(() {
        allBooks = books;
        filteredBooks = List.from(books);
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books'),
        actions: [
          if (_showSearch)
            Container(
              width: 200,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _searchController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  isDense: true,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      _toggleSearch();
                    },
                  ),
                ),
                onChanged: searchBookByTitle,
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus(); // Dismiss keyboard
                },
              ),
            )
          else
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: _toggleSearch,
            ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: getData,
        child: isLoaded
            ? ListView.builder(
                itemCount: _showSearch ? filteredBooks.length : allBooks.length,
                itemBuilder: (context, index) {
                  final book = _showSearch
                      ? filteredBooks[index]
                      : allBooks[index];
                  return InkWell(
                    onTap: () =>
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) =>
                        //         BookDetailsScreen(bookId: book.id!),
                        //   ),
                        // ),
                        Navigator.pushNamed(context, '/books/${book.id}'),
                    child: BookCard(book: book),
                  );
                },
              )
            : const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const AddBookScreen()),
          // );
          Navigator.pushNamed(context, '/addbook');
        },
        tooltip: 'Add Book',
        child: const Icon(Icons.add),
      ),
    );
  }
}
