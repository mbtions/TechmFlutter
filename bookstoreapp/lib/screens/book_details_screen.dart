import 'package:bookstoreapp/model/book.dart';
import 'package:bookstoreapp/screens/edit_book_screen.dart';
import 'package:bookstoreapp/services/book_remote_services.dart';
import 'package:flutter/material.dart';

// FOR DISPLAYING ONE BOOK AS PER ID (GET REQUEST) WITH DELETE OPTION (DELETE REQUEST)
class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key, required this.bookId});

  final int bookId;

  @override
  State<BookDetailsScreen> createState() => BookDetailsScreenState();
}

class BookDetailsScreenState extends State<BookDetailsScreen> {
  late final Book book;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getBookById(widget.bookId);
  }

  getBookById(int id) async {
    book = (await BookRemoteServices().getBookById(id))!;
    if (book != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  deleteBook(int id) async {
    bool status = await BookRemoteServices().deleteBook(id);
    if (status) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Book deleted successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to delete the book!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title ?? 'Book Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => deleteBook(book.id!),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await getBookById(widget.bookId);
        },
        child: Visibility(
          visible: isLoaded,
          replacement: Center(child: const CircularProgressIndicator()),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Book cover and basic info row
                  _buildBookHeader(context),
                  const SizedBox(height: 24),

                  // About section
                  _buildSectionTitle('About the Book'),
                  Text(
                    book.desc ?? 'No description available',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),

                  // Details section
                  _buildSectionTitle('Details'),
                  _buildDetailRow('Author', book.author),
                  _buildDetailRow('Publisher', book.publisher),
                  _buildDetailRow('Published', book.year.toString()),
                  _buildDetailRow('Pages', book.pages.toString()),
                  _buildDetailRow('Language', book.language),
                  _buildDetailRow('Genre', book.genre),
                  const SizedBox(height: 16),

                  // Rating section
                  // _buildRatingSection(context),
                  const SizedBox(height: 24),

                  // Added by section
                  _buildAddedBySection(),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => EditBookScreen(book: book)),
        ),
        child: const Icon(Icons.edit),
      ),
    );
  }

  Widget _buildBookHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Book cover
        Hero(
          tag: 'book-cover-${book.id}',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              book.coverPageUrl ?? '',
              width: 120,
              height: 180,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 120,
                height: 180,
                color: Colors.grey[200],
                child: const Icon(Icons.book, size: 50),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),

        // Title and basic info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.title ?? 'Unknown Title',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'by ${book.author ?? 'Unknown Author'}',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  const SizedBox(width: 4),
                  Text(
                    book.rating?.toString() ?? 'N/A',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  Chip(
                    label: Text(book.genre ?? 'Unknown'),
                    backgroundColor: Colors.blue[50],
                  ),
                  Chip(
                    label: Text(book.language ?? 'Unknown'),
                    backgroundColor: Colors.green[50],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(value),
        ],
      ),
    );
  }

  // Widget _buildRatingSection(BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       _buildSectionTitle('Rating'),
  //       Row(
  //         children: [
  //           Icon(Icons.star, color: Colors.amber, size: 30),
  //           const SizedBox(width: 8),
  //           Text(
  //             '${book.rating ?? 'N/A'} / 5.0',
  //             style: Theme.of(context).textTheme.titleLarge,
  //           ),
  //         ],
  //       ),
  //       const SizedBox(height: 8),
  //       SizedBox(
  //         width: double.infinity,
  //         child: ElevatedButton(
  //           onPressed: () => _rateBook(context),
  //           child: const Text('Rate this book'),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildAddedBySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Text(
          'Added by: ${book.addedBy ?? 'Unknown'}',
          style: TextStyle(color: Colors.grey[600]),
        ),
      ],
    );
  }

  // void _shareBook(BuildContext context) {
  //   // Implement share functionality
  //   ScaffoldMessenger.of(
  //     context,
  //   ).showSnackBar(const SnackBar(content: Text('Sharing book...')));
  // }

  // void _addToFavorites(BuildContext context) {
  //   // Implement favorite functionality
  //   ScaffoldMessenger.of(
  //     context,
  //   ).showSnackBar(const SnackBar(content: Text('Added to favorites!')));
  // }

  // void _rateBook(BuildContext context) {
  //   // Implement rating functionality
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text('Rate this book'),
  //       content: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           const Text('How would you rate this book?'),
  //           const SizedBox(height: 16),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: List.generate(5, (index) {
  //               return Icon(
  //                 Icons.star,
  //                 color: index < (book.rating ?? 0)
  //                     ? Colors.amber
  //                     : Colors.grey,
  //                 size: 30,
  //               );
  //             }),
  //           ),
  //         ],
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: const Text('Cancel'),
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             Navigator.pop(context);
  //             ScaffoldMessenger.of(context).showSnackBar(
  //               const SnackBar(content: Text('Thanks for rating!')),
  //             );
  //           },
  //           child: const Text('Submit'),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
