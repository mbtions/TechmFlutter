import 'package:bookstoreapp/services/book_remote_services.dart';
import 'package:bookstoreapp/model/book.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';
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
    getBook();
  }

  Future<void> getBook() async {
    final retrievedBook = await BookRemoteServices().getBookById(widget.bookId);
    if (retrievedBook != null) {
      setState(() {
        book = retrievedBook;
        isLoaded = true;
      });
    }
  }

  Future<void> deleteBook(int id) async {
    bool status = await BookRemoteServices().deleteBook(id);
    if (status) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Book deleted successfully!'),
          backgroundColor: Colors.green,
        ),
      );
      // navigate back to the home screen
      Navigator.popAndPushNamed(context, "/");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to delete the book!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _showShareOptions(BuildContext context) {
    final String shareText =
        '''
        📚 ${book.title ?? 'Unknown Title'}
        ✍️ Author: ${book.author ?? 'Unknown Author'}
        📖 Genre: ${book.genre ?? 'Unknown'}
        ⭐ Rating: ${book.rating?.toString() ?? 'N/A'}

        ${book.desc ?? 'No description provided.'}
        ''';

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share with other apps'),
              onTap: () {
                Navigator.pop(context);
                Share.share(
                  shareText,
                  subject: book.title ?? 'Check out this book!',
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.copy),
              title: const Text('Copy to clipboard'),
              onTap: () {
                Clipboard.setData(ClipboardData(text: shareText));
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Copied to clipboard')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title ?? 'Book Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => _showShareOptions(context),
            // _shareBook(context),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => deleteBook(book.id!),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: getBook,
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
                    textAlign: TextAlign.justify,
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
        onPressed: () =>
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (context) => EditBookScreen(book: book)),
            // ),
            Navigator.pushNamed(context, '/updatebook', arguments: book),
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
}
