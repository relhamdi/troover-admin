import 'package:troover_admin/models/_models.dart';

class ApplyDemandRaw extends JsonSerializable {
  Demand demand;
  String? status;
  DateTime creationDate;

  ApplyDemandRaw({
    required this.demand,
    required this.status,
    DateTime? creationDate,
  }) : creationDate = creationDate ?? DateTime.now();

  @override
  Map<String, dynamic> toJson() {
    return {
      'demandId': demand.id,
      'status': status,
      'creationDate': creationDate.toIso8601String(),
    };
  }
}

class ApplyDemand extends ApplyDemandRaw {
  int id;
  User user;

  ApplyDemand({
    required this.id,
    required this.user,
    required Demand demand,
    required String? status,
    DateTime? creationDate,
  }) : super(demand: demand, status: status, creationDate: creationDate);

  @override
  factory ApplyDemand.fromJson(Map<String, dynamic> json) {
    return ApplyDemand(
      id: json['id'] ?? 0,
      user: json['user'] != null
          ? json['user'] is User
              ? json['user']
              : User.fromJson(json['user'])
          : null,
      demand: json['demand'] != null
          ? json['demand'] is Demand
              ? json['demand']
              : Demand.fromJson(json['demand'])
          : null,
      status: json['status'] ?? '',
      creationDate: json['creationDate'] != null
          ? DateTime.parse(json['creationDate'])
          : DateTime.now(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final parentJson = super.toJson();
    parentJson.addAll({
      'id': id,
      'userId': user.id,
    });
    return parentJson;
  }
}
