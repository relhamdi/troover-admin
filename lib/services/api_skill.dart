import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/utils/_utils.dart';

class ApiSkill {
  Future<List<Skill>> getAll(String token) async {
    final response = await http.get(
      Uri.parse('${Constants.baseURL}/skills'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((dynamic item) => Skill.fromJson(item)).toList();
    } else {
      throw Exception('${response.statusCode} - Failed to load skills');
    }
  }

  Future<Skill> insert(String token, Skill skill) async {
    final response = await http.post(
      Uri.parse('${Constants.baseURL}/skills'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
      body: jsonEncode(skill.toJson()),
    );
    if (response.statusCode == 200) {
      return Skill.fromJson(json.decode(response.body));
    } else {
      throw Exception('${response.statusCode} - Failed to add skill');
    }
  }

  Future<Skill> update(String token, Skill skill) async {
    final response = await http.put(
      Uri.parse('${Constants.baseURL}/skills/${skill.id}'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
      body: jsonEncode(skill.toJson()),
    );
    if (response.statusCode == 200) {
      return Skill.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          '${response.statusCode} - Failed to update skill ${skill.id}');
    }
  }

  Future<bool> delete(String token, Skill skill) async {
    final response = await http.delete(
      Uri.parse('${Constants.baseURL}/skills/${skill.id}'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(
          '${response.statusCode} - Failed to delete skill ${skill.id}');
    }
  }
}
