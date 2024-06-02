import 'package:troover_admin/models/_models.dart';

class Experience extends JsonSerializable {
  int id;
  String? societyName;
  String? postName;
  String? place;
  DateTime? startDate;
  DateTime? endDate;
  String? description;
  Resume? resume;

  Experience({
    required this.id,
    required this.societyName,
    required this.postName,
    required this.place,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.resume,
  });

  @override
  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      id: json['id'] ?? 0,
      societyName: json['societyName'] ?? '',
      postName: json['postName'] ?? '',
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
      'societyName': societyName,
      'postName': postName,
      'place': place,
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'description': description,
      'resume': resume?.id,
    };
  }
}
