import 'package:bookstoreapp/model/book.dart';
import 'package:flutter/material.dart';
import 'package:bookstoreapp/services/book_remote_services.dart';

class EditBookScreen extends StatefulWidget {
  final Book book;
  final int bookId;

  const EditBookScreen({super.key, required this.bookId, required this.book});

  @override
  State<EditBookScreen> createState() => _EditBookScreenState();
}

class _EditBookScreenState extends State<EditBookScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _addedByController = TextEditingController();
  final _descController = TextEditingController();
  final _coverUrlController = TextEditingController();
  final _yearController = TextEditingController();
  final _genreController = TextEditingController();
  final _languageController = TextEditingController();
  final _pagesController = TextEditingController();
  final _publisherController = TextEditingController();
  final _ratingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.book.title;
    _authorController.text = widget.book.author;
    _addedByController.text = widget.book.addedBy;
    _descController.text = widget.book.desc;
    _coverUrlController.text = widget.book.coverPageUrl;
    _yearController.text = widget.book.year.toString();
    _genreController.text = widget.book.genre;
    _languageController.text = widget.book.language;
    _pagesController.text = widget.book.pages.toString();
    _publisherController.text = widget.book.publisher;
    _ratingController.text = widget.book.rating.toString();
  }

  void _submitUpdateBook() {
    if (_formKey.currentState!.validate()) {
      Book book = Book(
        author: _authorController.text.trim(),
        addedBy: _addedByController.text.trim(),
        title: _titleController.text.trim(),
        desc: _descController.text.trim(),
        coverPageUrl: _coverUrlController.text.trim(),
        year: int.tryParse(_yearController.text.trim()) ?? 0,
        genre: _genreController.text.trim(),
        language: _languageController.text.trim(),
        pages: int.tryParse(_pagesController.text.trim()) ?? 0,
        publisher: _publisherController.text.trim(),
        rating: double.tryParse(_ratingController.text.trim()) ?? 0,
      );

      // Send to server via PUT request
      updateBook(widget.bookId, book);
    }
  }

  updateBook(int bookId, Book book) async {
    bool status = (await BookRemoteServices().updateBook(bookId, book));
    if (status) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Book updated successfully!'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to Update book!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Book"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(_titleController, "Title"),
              _buildTextField(_authorController, "Author"),
              _buildTextField(_addedByController, "Added By"),
              _buildTextField(_descController, "Description", maxLines: 3),
              _buildTextField(_coverUrlController, "Cover Page URL"),
              _buildTextField(_yearController, "Year", isNumber: true),
              _buildTextField(_genreController, "Genre"),
              _buildTextField(_languageController, "Language"),
              _buildTextField(_pagesController, 'Total Pages', isNumber: true),
              _buildTextField(_publisherController, 'Publisher'),
              _buildTextField(_ratingController, 'Ratings', isNumber: true),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _submitUpdateBook,
                icon: const Icon(Icons.send),
                label: const Text("Submit"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    int maxLines = 1,
    bool isNumber = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }
}
