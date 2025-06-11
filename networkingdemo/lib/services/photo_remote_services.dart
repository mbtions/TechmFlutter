import 'package:networkingdemo/models/photo.dart';
import 'package:http/http.dart' as http;

class PhotoRemoteServices {
  Future<List<Photo>?> getAllPhotos() async {
    var client = http.Client();
    var url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    var response = await client.get(url);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return photoListFromJson(jsonString);
    }
  }
}
