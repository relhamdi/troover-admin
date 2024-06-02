import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/utils/_utils.dart';

class ApiResume {
  Future<List<Resume>> getAll(String token) async {
    final response = await http.get(
      Uri.parse('${Constants.baseURL}/resumes'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((dynamic item) => Resume.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load resumes');
    }
  }

  Future<Resume> insert(String token, Resume resume) async {
    final response = await http.post(
      Uri.parse('${Constants.baseURL}/resumes'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
      body: jsonEncode(resume.toJson()),
    );
    if (response.statusCode == 200) {
      return Resume.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add resume');
    }
  }

  Future<Resume> update(String token, Resume resume) async {
    final response = await http.put(
      Uri.parse('${Constants.baseURL}/resumes/${resume.id}'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
      body: jsonEncode(resume.toJson()),
    );
    if (response.statusCode == 200) {
      return Resume.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update resume ${resume.id}');
    }
  }

  Future<bool> delete(String token, Resume resume) async {
    final response = await http.delete(
      Uri.parse('${Constants.baseURL}/resumes/${resume.id}'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to delete resume ${resume.id}');
    }
  }
}
