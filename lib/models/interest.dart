import 'package:troover_admin/models/_models.dart';

class Interest extends JsonSerializable {
  int id;
  String? label;
  String? type;
  Resume? resume;

  Interest({
    required this.id,
    required this.label,
    required this.type,
    required this.resume,
  });

  @override
  factory Interest.fromJson(Map<String, dynamic> json) {
    return Interest(
      id: json['id'] ?? 0,
      label: json['label'] ?? '',
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
      'label': label,
      'type': type,
      'resumeId': resume?.id,
    };
  }
}
