import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/utils/_utils.dart';

class ApiCompany {
  Future<List<Company>> getAll(String token) async {
    final response = await http.get(
      Uri.parse('${Constants.baseURL}/companies'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((dynamic item) => Company.fromJson(item)).toList();
    } else {
      throw Exception('${response.statusCode} - Failed to load companies');
    }
  }

  Future<Company> insert(String token, Company company) async {
    final response = await http.post(
      Uri.parse('${Constants.baseURL}/companies'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
      body: jsonEncode(company.toJson()),
    );
    if (response.statusCode == 200) {
      return Company.fromJson(json.decode(response.body));
    } else {
      throw Exception('${response.statusCode} - Failed to add company');
    }
  }

  Future<Company> update(String token, Company company) async {
    final response = await http.put(
      Uri.parse('${Constants.baseURL}/companies/${company.id}'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
      body: jsonEncode(company.toJson()),
    );
    if (response.statusCode == 200) {
      return Company.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          '${response.statusCode} - Failed to update company ${company.id}');
    }
  }

  Future<bool> delete(String token, Company company) async {
    final response = await http.delete(
      Uri.parse('${Constants.baseURL}/companies/${company.id}'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(
          '${response.statusCode} - Failed to delete company ${company.id}');
    }
  }
}
