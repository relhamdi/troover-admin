import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/services/_services.dart';
import 'package:troover_admin/utils/_utils.dart';

class ApiDemand {
  const ApiDemand({
    required this.apiDomain,
  });

  final ApiDomain apiDomain;

  Future<List<Demand>> getAll(String token) async {
    final response = await http.get(
      Uri.parse('${Constants.baseURL}/demands'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return await Future.wait(
        body.map((dynamic item) async {
          Demand demand = Demand.fromJson(item);
          demand.domains = await getDemandDomains(token, demand);
          return demand;
        }),
      );
    } else {
      throw Exception('${response.statusCode} - Failed to load demands');
    }
  }

  Future<Demand> insert(String token, Demand demand) async {
    final response = await http.post(
      Uri.parse('${Constants.baseURL}/demands'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
      body: jsonEncode(demand.toJson()),
    );
    if (response.statusCode == 200) {
      Demand newDemand = Demand.fromJson(json.decode(response.body));
      newDemand.domains = demand.domains;
      // await addDemandDomains(token, newDemand);
      return newDemand;
    } else {
      throw Exception('${response.statusCode} - Failed to add demand');
    }
  }

  Future<Demand> update(String token, Demand demand) async {
    final response = await http.put(
      Uri.parse('${Constants.baseURL}/demands/${demand.id}'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
      body: jsonEncode(demand.toJson()),
    );
    if (response.statusCode == 200) {
      await deleteDemandDomains(token, demand);
      Demand newDemand = Demand.fromJson(json.decode(response.body));
      newDemand.domains = demand.domains;
      // await addDemandDomains(token, newDemand);
      return newDemand;
    } else {
      throw Exception(
          '${response.statusCode} - Failed to update demand ${demand.id}');
    }
  }

  Future<bool> delete(String token, Demand demand) async {
    final response = await http.delete(
      Uri.parse('${Constants.baseURL}/demands/${demand.id}'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      bool res = await deleteDemandDomains(token, demand);
      return true && res;
    } else {
      throw Exception(
          '${response.statusCode} - Failed to delete demand ${demand.id}');
    }
  }

  ///
  /// Demand-Domain
  ///
  ////************************************************* */
  ////************************************************* */
  Future<List<Domain>> getDemandDomains(String token, Demand demand) async {
    final response = await http.get(
      Uri.parse('${Constants.baseURL}/demand-domain/demands/${demand.id}'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return await Future.wait(
        body.map((dynamic item) async {
          return await apiDomain.getById(token, item['domainId']);
        }),
      );
    } else {
      throw Exception(
          '${response.statusCode} - Failed to load demand-domains for demand ${demand.id}');
    }
  }

  Future<void> addDemandDomains(String token, Demand demand) async {
    demand.domains.forEach((domain) async {
      final response = await http.post(
        Uri.parse('${Constants.baseURL}/demand-domain'),
        headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
        body: jsonEncode(DemandDomain(
          demandId: demand.id,
          domainId: domain.id,
        ).toJson()),
      );
      if (response.statusCode != 200) {
        throw Exception(
            '${response.statusCode} - Failed to add demand-domains for demand ${demand.id}');
      }
    });
  }

  Future<bool> deleteDemandDomains(String token, Demand demand) async {
    final response = await http.delete(
      Uri.parse('${Constants.baseURL}/demand-domain/demands/${demand.id}'),
      headers: ApiUtils.getHeaders({'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(
          'Failed to delete demand-domains for demand ${demand.id}');
    }
  }
}
