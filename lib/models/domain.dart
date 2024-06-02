import 'package:troover_admin/models/_models.dart';

class DomainRaw extends JsonSerializable {
  String name;
  Domain? domainParent;

  DomainRaw({
    required this.name,
    this.domainParent,
  });

  // Method to convert Demand object to JSON data
  @override
  Map<String, dynamic> toJson() {
    return {
      'domainId': domainParent?.id,
      'name': name,
    };
  }
}

class Domain extends DomainRaw {
  int id;

  Domain({
    required this.id,
    required name,
    domainParent,
  }) : super(name: name, domainParent: domainParent);

  @override
  String toString() => '$name (ID $id)';

  @override
  factory Domain.fromJson(Map<String, dynamic> json) {
    return Domain(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      domainParent: json['domainParent'] != null
          ? json['domainParent'] is Domain
              ? json['domainParent']
              : Domain.fromJson(json['domainParent'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'domainParent': domainParent?.id,
    };
  }

  Map<String, dynamic> asRaw() => super.toJson();
}
