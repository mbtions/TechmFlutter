import 'package:networkingdemo/models/user.dart';
import 'package:http/http.dart' as http;

class UserRemoteServices {
  Future<List<User>?> getAllUsers() async {
    var client = http.Client();
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await client.get(url);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return userListFromJson(jsonString);
    }
  }
}
