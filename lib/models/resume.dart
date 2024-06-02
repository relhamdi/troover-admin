import 'package:troover_admin/models/_models.dart';

class Resume extends JsonSerializable {
  int id;
  String? motorize;
  String? frequency;
  User? user;

  Resume({
    required this.id,
    required this.motorize,
    required this.frequency,
    required this.user,
  });

  @override
  String toString() => 'Resume $id';

  @override
  factory Resume.fromJson(Map<String, dynamic> json) {
    return Resume(
      id: json['id'] ?? 0,
      motorize: json['motorize'] ?? '',
      frequency: json['frequency'] ?? '',
      user: json['user'] != null
          ? json['user'] is User
              ? json['user']
              : User.fromJson(json['user'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'motorize': motorize,
      'frequency': frequency,
      'userId': user?.id,
    };
  }
}
