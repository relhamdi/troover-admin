import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/utils/_utils.dart';

class ApiSubscription {
  Future<Subscription> getById(String token, int id) async {
    final response = await http.get(
      Uri.parse('${Constants.baseURL}/subscriptions/$id'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      return Subscription.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load subscription $id');
    }
  }

  Future<List<Subscription>> getAll(String token) async {
    final response = await http.get(
      Uri.parse('${Constants.baseURL}/subscriptions'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((dynamic item) => Subscription.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load subscriptions');
    }
  }

  Future<Subscription> insert(String token, Subscription subscription) async {
    final response = await http.post(
      Uri.parse('${Constants.baseURL}/subscriptions'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
      body: jsonEncode(subscription),
    );
    if (response.statusCode == 200) {
      return Subscription.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add subscription');
    }
  }

  Future<bool> delete(String token, Subscription subscription) async {
    final response = await http.delete(
      Uri.parse('${Constants.baseURL}/subscriptions/${subscription.id}'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to delete subscription ${subscription.id}');
    }
  }
}
