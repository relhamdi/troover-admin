import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/utils/_utils.dart';

class ApiDomain {
  Future<Domain> getById(String token, int id) async {
    final response = await http.get(
      Uri.parse('${Constants.baseURL}/domains/$id'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      return Domain.fromJson(json.decode(response.body));
    } else {
      throw Exception('${response.statusCode} - Failed to load domain $id');
    }
  }

  Future<List<Domain>> getAll(String token) async {
    final response = await http.get(
      Uri.parse('${Constants.baseURL}/domains'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((dynamic item) => Domain.fromJson(item)).toList();
    } else {
      throw Exception('${response.statusCode} - Failed to load domains');
    }
  }

  Future<Domain> insert(String token, Domain domain) async {
    final response = await http.post(
      Uri.parse('${Constants.baseURL}/domains'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
      body: jsonEncode(domain.asRaw()),
    );
    if (response.statusCode == 200) {
      return Domain.fromJson(json.decode(response.body));
    } else {
      throw Exception('${response.statusCode} - Failed to add domain');
    }
  }

  Future<bool> delete(String token, Domain domain) async {
    final response = await http.delete(
      Uri.parse('${Constants.baseURL}/domains/${domain.id}'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(
          '${response.statusCode} - Failed to delete domain ${domain.id}');
    }
  }
}
