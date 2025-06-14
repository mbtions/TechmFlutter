import 'package:bookstoreapp/model/book.dart';
import 'package:flutter/material.dart';
import 'package:bookstoreapp/services/book_remote_services.dart';

// FOR UPDATING THE BOOK (PUT REQUEST)
class EditBookScreen extends StatefulWidget {
  const EditBookScreen({super.key, required this.book});

  final Book book;

  @override
  State<EditBookScreen> createState() => _EditBookScreenState();
}

class _EditBookScreenState extends State<EditBookScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _titleController;
  late TextEditingController _authorController;
  late TextEditingController _descController;
  late TextEditingController _coverUrlController;
  late TextEditingController _yearController;
  late TextEditingController _genreController;
  late TextEditingController _languageController;
  late TextEditingController _pagesController;
  late TextEditingController _publisherController;
  late TextEditingController _ratingController;
  late TextEditingController _addedByController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.book.title);
    _authorController = TextEditingController(text: widget.book.author);
    _descController = TextEditingController(text: widget.book.desc);
    _coverUrlController = TextEditingController(text: widget.book.coverPageUrl);
    _yearController = TextEditingController(text: widget.book.year.toString());
    _genreController = TextEditingController(text: widget.book.genre);
    _languageController = TextEditingController(text: widget.book.language);
    _pagesController = TextEditingController(
      text: widget.book.pages.toString(),
    );
    _publisherController = TextEditingController(text: widget.book.publisher);
    _ratingController = TextEditingController(
      text: widget.book.rating.toString(),
    );
    _addedByController = TextEditingController(text: widget.book.addedBy);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _descController.dispose();
    _coverUrlController.dispose();
    _yearController.dispose();
    _genreController.dispose();
    _languageController.dispose();
    _pagesController.dispose();
    _publisherController.dispose();
    _ratingController.dispose();
    _addedByController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final updatedBook = Book(
        id: widget.book.id,
        title: _titleController.text,
        author: _authorController.text ?? 'Unknown',
        desc: _descController.text ?? 'TO BE UPDATED',
        coverPageUrl: _coverUrlController.text,
        year: int.tryParse(_yearController.text) ?? 2025,
        genre: _genreController.text,
        language: _languageController.text,
        pages: int.tryParse(_pagesController.text) ?? 0,
        publisher: _publisherController.text,
        rating: double.tryParse(_ratingController.text) ?? 2.0,
        addedBy: _addedByController.text ?? 'admin',
      );

      updateBook(updatedBook);
      Navigator.pop(context);
    }
  }

  updateBook(Book book) async {
    bool status = await BookRemoteServices().updateBook(book);
    if (status) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Book updated successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update Book')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField('Title', _titleController),
              _buildTextField('Author', _authorController),
              _buildTextField('Description', _descController),
              _buildTextField('Cover Page URL', _coverUrlController),
              _buildTextField(
                'Year',
                _yearController,
                keyboardType: TextInputType.number,
              ),
              _buildTextField('Genre', _genreController),
              _buildTextField('Language', _languageController),
              _buildTextField(
                'Pages',
                _pagesController,
                keyboardType: TextInputType.number,
              ),
              _buildTextField('Publisher', _publisherController),
              _buildTextField(
                'Rating',
                _ratingController,
                keyboardType: TextInputType.number,
              ),
              _buildTextField('Added By', _addedByController),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Update Book'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
