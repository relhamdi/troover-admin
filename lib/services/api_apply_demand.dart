import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/utils/_utils.dart';

class ApiApplyDemand {
  Future<List<ApplyDemand>> getAll(String token) async {
    final response = await http.get(
      Uri.parse('${Constants.baseURL}/applyDemands'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((dynamic item) => ApplyDemand.fromJson(item)).toList();
    } else {
      throw Exception('${response.statusCode} - Failed to load applyDemands');
    }
  }

  Future<ApplyDemand> insert(
    String token,
    ApplyDemand applyDemand,
  ) async {
    final response = await http.post(
      Uri.parse('${Constants.baseURL}/applyDemands'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
      body: jsonEncode(applyDemand.toJson()),
    );
    if (response.statusCode == 200) {
      return ApplyDemand.fromJson(json.decode(response.body));
    } else {
      throw Exception('${response.statusCode} - Failed to add applyDemand');
    }
  }

  Future<ApplyDemand> update(
    String token,
    ApplyDemand applyDemand,
  ) async {
    final response = await http.put(
      Uri.parse('${Constants.baseURL}/applyDemands/${applyDemand.id}'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
      body: jsonEncode(applyDemand.toJson()),
    );
    if (response.statusCode == 200) {
      return ApplyDemand.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          '${response.statusCode} - Failed to update applyDemand ${applyDemand.id}');
    }
  }

  Future<bool> delete(
    String token,
    ApplyDemand applyDemand,
  ) async {
    final response = await http.delete(
      Uri.parse('${Constants.baseURL}/applyDemands/${applyDemand.id}'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(
          '${response.statusCode} - Failed to delete applyDemand ${applyDemand.id}');
    }
  }
}
