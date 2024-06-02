import 'package:troover_admin/models/_models.dart';

class Company extends JsonSerializable {
  int id;
  User? user;
  String name;
  String siret;
  Subscription? subscription;

  Company({
    required this.id,
    required this.user,
    required this.name,
    required this.siret,
    required this.subscription,
  });

  @override
  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'] ?? 0,
      user: json['user'] != null
          ? json['user'] is User
              ? json['user']
              : User.fromJson(json['user'])
          : null,
      name: json['name'] ?? '',
      siret: json['siret'] ?? '',
      subscription: json['subscription'] != null
          ? json['subscription'] is Subscription
              ? json['subscription']
              : Subscription.fromJson(json['subscription'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': user?.id,
      'name': name,
      'siret': siret,
      'subscriptionId': subscription?.id,
    };
  }
}
