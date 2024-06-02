import 'package:troover_admin/models/_models.dart';

class Degree extends JsonSerializable {
  int id;
  String? name;
  String? school;
  String? place;
  DateTime? startDate;
  DateTime? endDate;
  String? description;
  Resume? resume;

  Degree({
    required this.id,
    required this.name,
    required this.school,
    required this.place,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.resume,
  });

  @override
  factory Degree.fromJson(Map<String, dynamic> json) {
    return Degree(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      school: json['school'] ?? '',
      place: json['place'] ?? '',
      startDate:
          json['startDate'] != null ? DateTime.parse(json['startDate']) : null,
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
      description: json['description'] ?? '',
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
      'school': school,
      'place': place,
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'description': description,
      'resumeId': resume?.id,
    };
  }
}
