import 'package:bookstoreapp/model/book.dart';
import 'package:http/http.dart' as http;

class BookRemoteServices {
  Future<List<Book>?> getAllBooks() async {
    var client = http.Client();
    // var url = Uri.parse('http://10.0.2.2:3000/books');

    var url = Uri.parse('http://64.227.179.213:3000/books');
    var response = await client.get(url);

    if (response.statusCode == 200) {
      return bookListfromJson(response.body);
    }

    return null;
  }

  Future<Book?> getBookById(int id) async {
    var client = http.Client();
    // var url = Uri.parse("http://10.0.2.2:3000/books/$id");

    var url = Uri.parse('http://64.227.179.213:3000/books/$id');
    var response = await client.get(url);

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return bookFromJson(jsonData);
    }

    return null;
  }

  Future<bool> updateBook(Book book) async {
    var client = http.Client();
    // var url = Uri.parse("http://10.0.2.2:3000/updatebook/$id");

    var url = Uri.parse('http://64.227.179.213:3000/updatebook/${book.id}');
    var response = await client.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: bookToJson(book),
    );

    if (response.statusCode == 200 || response.statusCode == 204) {
      return true;
    }

    return false;
  }

  Future<bool> addBook(Book book) async {
    var client = http.Client();
    // var url = Uri.parse("http://10.0.2.2:3000/addbook");

    var url = Uri.parse('http://64.227.179.213:3000/addbook');
    final response = await client.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: bookToJson(book),
    );

    if (response.statusCode == 201) {
      return true;
    }

    return false;
  }

  Future<bool> deleteBook(int id) async {
    var client = http.Client();
    // var url = Uri.parse("http://10.0.2.2:3000/deletebook/$id");

    var url = Uri.parse('http://64.227.179.213:3000/deletebook/$id');
    var response = await client.delete(url);

    if (response.statusCode == 204) {
      return true;
    }

    return false;
  }
}
