class Company {
  int? id; // Id is generated automatically by the database
  int? userId;
  String? name;
  String? siret;
  int? subscriptionId;

  Company({
    this.id,
    this.userId,
    this.name,
    this.siret,
    this.subscriptionId,
  });

  // Factory constructor for creating a Company object from JSON data
  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'] ?? 0,
      userId: json['user_id'],
      name: json['name'],
      siret: json['siret'],
      subscriptionId: json['subscription_id'],
    );
  }

  // Method to convert Company object to JSON data
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'name': name,
      'siret': siret,
      'subscription_id': subscriptionId,
    };
  }
}
