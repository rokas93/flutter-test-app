import 'package:http/http.dart' as http;
import 'dart:convert';

class HTTPRequest {
  //  Fetch all users
  Future<List<Map>> getUsers(url) async {
    List<Map> users = [];

    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String jsonString = response.body;
      List data = jsonDecode(jsonString);
      users = data.cast<Map>();
    }

    return users;
  }

  // Fetch one user data
  Future<Map> getUser(url) async {
    Map user = {};

    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String jsonString = response.body;
      user = jsonDecode(jsonString);
    }

    return user;
  }
}
