import 'package:troover_admin/models/_models.dart';

class Demand extends JsonSerializable {
  int id;
  User? user;
  String title;
  int duration;
  DateTime startDate;
  String place;
  bool enable;
  double salary;
  String schedule;
  int remoteDay;
  String extra;
  List<Domain> domains;

  Demand({
    required this.id,
    required this.user,
    required this.title,
    required this.duration,
    required this.startDate,
    required this.place,
    required this.enable,
    required this.salary,
    required this.schedule,
    required this.remoteDay,
    required this.extra,
    required this.domains,
  });

  @override
  String toString() => 'Demand $id';

  @override
  factory Demand.fromJson(Map<String, dynamic> json) {
    List _domains = json['domains'] ?? [];
    return Demand(
      id: json['id'] ?? 0,
      user: json['user'] != null
          ? json['user'] is User
              ? json['user']
              : User.fromJson(json['user'])
          : null,
      title: json['title'] ?? '',
      duration: json['duration'] ?? 0,
      startDate: DateTime.parse(json['startDate'] ?? ''),
      place: json['place'] ?? '',
      enable: json['enable'] ?? false,
      salary: json['salary'] ?? 0,
      schedule: json['schedule'] ?? '',
      remoteDay: json['remoteDay'] ?? 0,
      extra: json['extra'] ?? '',
      domains: _domains
          .map((item) => item is Domain ? item : Domain.fromJson(item))
          .toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': user?.id,
      'title': title,
      'duration': duration,
      'startDate': startDate.toIso8601String(),
      'place': place,
      'enable': enable,
      'salary': salary,
      'schedule': schedule,
      'remoteDay': remoteDay,
      'extra': extra,
      'domains': domains.map((item) => item.toString()).toList(),
    };
  }
}

class DemandDomain extends JsonSerializable {
  int demandId;
  int domainId;

  DemandDomain({
    required this.demandId,
    required this.domainId,
  });

  @override
  factory DemandDomain.fromJson(Map<String, dynamic> json) {
    return DemandDomain(
      demandId: json['demandId'] ?? 0,
      domainId: json['domainId'] ?? 0,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'demandId': demandId,
      'domainId': domainId,
    };
  }
}
