import 'package:troover_admin/models/_models.dart';

class Skill extends JsonSerializable{
  int id;
  String? name;
  String? description;
  String? type;
  Resume? resume;

  Skill({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.resume,
  });

  @override
  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      type: json['type'] ?? '',
      resume: json['resume'] != null
          ? json['resume'] is Resume
              ? json['resume']
              : Resume.fromJson(json['resume'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'type': type,
      'resumeId': resume?.id,
    };
  }
}
