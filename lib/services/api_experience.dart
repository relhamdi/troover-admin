import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/utils/_utils.dart';

class ApiExperience {
  Future<List<Experience>> getAll(String token) async {
    final response = await http.get(
      Uri.parse('${Constants.baseURL}/experiences'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((dynamic item) => Experience.fromJson(item)).toList();
    } else {
      throw Exception('${response.statusCode} - Failed to load experiences');
    }
  }

  Future<Experience> insert(String token, Experience experience) async {
    final response = await http.post(
      Uri.parse('${Constants.baseURL}/experiences'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
      body: jsonEncode(experience.toJson()),
    );
    if (response.statusCode == 200) {
      return Experience.fromJson(json.decode(response.body));
    } else {
      throw Exception('${response.statusCode} - Failed to add experience');
    }
  }

  Future<Experience> update(String token, Experience experience) async {
    final response = await http.put(
      Uri.parse('${Constants.baseURL}/experiences/${experience.id}'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
      body: jsonEncode(experience.toJson()),
    );
    if (response.statusCode == 200) {
      return Experience.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          '${response.statusCode} - Failed to update experience ${experience.id}');
    }
  }

  Future<bool> delete(String token, Experience experience) async {
    final response = await http.delete(
      Uri.parse('${Constants.baseURL}/experiences/${experience.id}'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(
          '${response.statusCode} - Failed to delete experience ${experience.id}');
    }
  }
}
