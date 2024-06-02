import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/utils/_utils.dart';

class ApiInterest {
  Future<List<Interest>> getAll(String token) async {
    final response = await http.get(
      Uri.parse('${Constants.baseURL}/interests'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((dynamic item) => Interest.fromJson(item)).toList();
    } else {
      throw Exception('${response.statusCode} - Failed to load interests');
    }
  }

  Future<Interest> insert(String token, Interest interest) async {
    final response = await http.post(
      Uri.parse('${Constants.baseURL}/interests'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
      body: jsonEncode(interest.toJson()),
    );
    if (response.statusCode == 200) {
      return Interest.fromJson(json.decode(response.body));
    } else {
      throw Exception('${response.statusCode} - Failed to add interest');
    }
  }

  Future<Interest> update(String token, Interest interest) async {
    final response = await http.put(
      Uri.parse('${Constants.baseURL}/interests/${interest.id}'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
      body: jsonEncode(interest.toJson()),
    );
    if (response.statusCode == 200) {
      return Interest.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          '${response.statusCode} - Failed to update interest ${interest.id}');
    }
  }

  Future<bool> delete(String token, Interest interest) async {
    final response = await http.delete(
      Uri.parse('${Constants.baseURL}/interests/${interest.id}'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(
          '${response.statusCode} - Failed to delete interest ${interest.id}');
    }
  }
}
