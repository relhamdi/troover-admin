import 'package:troover_admin/models/_models.dart';

enum UserTypes {
  apprentice('APPRENTICE'),
  enterprise('ENTERPRISE'),
  admin('ADMIN');

  final String value;

  const UserTypes(this.value);

  static List<String> getValues() {
    return UserTypes.values.map((e) => e.value).toList();
  }
}

class User extends JsonSerializable {
  int id;
  String firstname;
  String lastname;
  String email;
  int? imageId;
  DateTime? emailVerifiedAt;
  String password;
  bool? enabled;
  String? userType;
  DateTime createdAt;
  DateTime updatedAt;
  String? color;

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    this.imageId,
    this.emailVerifiedAt,
    required this.password,
    this.enabled,
    this.userType,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.color,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  @override
  String toString() => '$email [$userType] (ID $id)';

  @override
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'] ?? 0,
        firstname: json['firstname'] ?? '',
        lastname: json['lastname'] ?? '',
        email: json['email'],
        imageId: json['imageId'],
        emailVerifiedAt: json['emailVerifiedAt'] != null
            ? DateTime.parse(json['emailVerifiedAt'])
            : null,
        password: json['password'] ?? '',
        enabled: json['enable'] ?? false,
        userType: json['userType'],
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : null,
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : null,
        color: json['color']);
  }

  @override
  Map<String, dynamic> toJson() {
    updatedAt = DateTime.now();
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'imageId': imageId,
      'emailVerifiedAt': emailVerifiedAt?.toIso8601String(),
      'enable': enabled,
      'userType': userType,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'color': color,
    };
  }

  Map<String, dynamic> toFullJson() {
    Map<String, dynamic> jsonified = toJson();
    jsonified['password'] = password;
    jsonified['salt'] = null;
    return jsonified;
  }
}
