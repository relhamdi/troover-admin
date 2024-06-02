import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/utils/_utils.dart';

class ApiDegree {
  Future<List<Degree>> getAll(String token) async {
    final response = await http.get(
      Uri.parse('${Constants.baseURL}/degrees/all/0'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((dynamic item) => Degree.fromJson(item)).toList();
    } else {
      throw Exception('${response.statusCode} - Failed to load degrees');
    }
  }

  Future<Degree> insert(String token, Degree degree) async {
    final response = await http.post(
      Uri.parse('${Constants.baseURL}/degrees'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
      body: jsonEncode(degree.toJson()),
    );
    if (response.statusCode == 200) {
      return Degree.fromJson(json.decode(response.body));
    } else {
      throw Exception('${response.statusCode} - Failed to add degree');
    }
  }

  Future<Degree> update(String token, Degree degree) async {
    final response = await http.put(
      Uri.parse('${Constants.baseURL}/degrees/${degree.id}'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
      body: jsonEncode(degree.toJson()),
    );
    if (response.statusCode == 200) {
      return Degree.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          '${response.statusCode} - Failed to update degree ${degree.id}');
    }
  }

  Future<bool> delete(String token, Degree degree) async {
    final response = await http.delete(
      Uri.parse('${Constants.baseURL}/degrees/${degree.id}'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(
          '${response.statusCode} - Failed to delete degree ${degree.id}');
    }
  }
}
