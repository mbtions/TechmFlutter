import 'package:http/http.dart' as http;
import 'package:networkingdemo/models/post.dart';

class PostRemoteServices {
  Future<List<Post>?> getAllPosts() async {
    var client = http.Client();
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(url);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return postListFromJson(jsonString);
    }
  }
}
