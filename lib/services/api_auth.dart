import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/utils/_utils.dart';

class ApiAuth {
  Future<String> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('${Constants.baseURL}/auth/login'),
      body: jsonEncode({'username': email, 'password': password}),
      headers: ApiUtils.getHeaders(),
    );

    if (response.statusCode == 200) {
      // print(jsonDecode(response.body));
      return jsonDecode(response.body)['token'];
    } else {
      throw Exception('Failed to log in $email');
    }
  }

  Future<User> getConnectedUserInfo(String token) async {
    final response = await http.get(
      Uri.parse('${Constants.baseURL}/user/me'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }
}
