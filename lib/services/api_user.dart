import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/utils/_utils.dart';

class ApiUser {
  Future<List<User>> getAll(String token) async {
    final response = await http.get(
      Uri.parse('${Constants.baseURL}/user'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((dynamic item) => User.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<User> insert(String token, User user) async {
    final response = await http.post(
      Uri.parse('${Constants.baseURL}/user'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
      body: jsonEncode(user.toFullJson()),
    );
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add user');
    }
  }

  Future<bool> delete(String token, User user) async {
    final response = await http.delete(
      Uri.parse('${Constants.baseURL}/user/${user.id}'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to delete demand ${user.id}');
    }
  }
}
