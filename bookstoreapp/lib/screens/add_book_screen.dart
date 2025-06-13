// import 'package:flutter/material.dart';

// class AddBookScreen extends StatefulWidget {
//   const AddBookScreen({super.key});
//   @override
//   State<AddBookScreen> createState() {
//     return AddBookScreenState();
//   }
// }

// class AddBookScreenState extends State<AddBookScreen> {
//   TextEditingController titleController = TextEditingController();
//   TextEditingController authorController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   TextEditingController priceController = TextEditingController();
//   TextEditingController coverPageUrlController = TextEditingController();
//   TextEditingController ratingController = TextEditingController();
//   TextEditingController publisherController = TextEditingController();

//   // dropdown menu for genre, language, added by,
//   addData() {}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Add Book')),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextField(
//                 controller: titleController,
//                 decoration: InputDecoration(labelText: 'Title'),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextField(
//                 controller: authorController,
//                 decoration: InputDecoration(labelText: 'Author'),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextField(
//                 controller: descriptionController,
//                 decoration: InputDecoration(labelText: 'Description'),
//                 maxLines: 4,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextField(
//                 controller: priceController,
//                 decoration: InputDecoration(labelText: 'Price'),
//                 keyboardType: TextInputType.number,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextField(
//                 controller: coverPageUrlController,
//                 decoration: InputDecoration(labelText: 'Cover Page URL'),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextField(
//                 controller: ratingController,
//                 decoration: InputDecoration(labelText: 'Rating'),
//                 keyboardType: TextInputType.number,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextField(
//                 controller: publisherController,
//                 decoration: InputDecoration(labelText: 'Publisher'),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Handle book submission logic here
//                   // For example, you can call a service to save the book data
//                   // and then navigate back to the previous screen.
//                   addData();
//                   Navigator.pop(context);
//                 },
//                 child: Text('Add Book'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:bookstoreapp/model/book.dart';
import 'package:bookstoreapp/services/book_remote_services.dart';
import 'package:flutter/material.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({super.key});

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
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

  void _submitBook() async {
    if (_formKey.currentState!.validate()) {
      print("Book form validated...");
      Book newBook = Book(
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

      // Send to server via POST request
      bool status = await BookRemoteServices().addBook(newBook);
      print("Status received: $status");
      if (status) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Book added successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to add book!'),
            backgroundColor: Colors.red,
          ),
        );
      }
      Navigator.pop(context);
    }
  }

  // addBook(Book book) async {
  //   bool status = await BookRemoteServices().addBook(book);
  //   if (status) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Book added successfully!'),
  //         backgroundColor: Colors.green,
  //       ),
  //     );
  //     Navigator.of(context).pop();
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Failed to add book!'),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //   }
  // }

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
                onPressed: _submitBook,
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
