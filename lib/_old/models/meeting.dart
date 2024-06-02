class Meeting {
  int? id;
  DateTime? date;
  DateTime? counterDate;
  bool? acceptedCompany;
  bool? acceptedApprentice;
  bool? validateCompany;
  bool? validateApprentice;
  bool? refused;
  DateTime? creationDate;
  String? type;
  int? applyDemandId;

  Meeting({
    this.id,
    this.date,
    this.counterDate,
    this.acceptedCompany,
    this.acceptedApprentice,
    this.validateCompany,
    this.validateApprentice,
    this.refused,
    this.creationDate,
    this.type,
    this.applyDemandId,
  });

  // Factory constructor for creating a Meeting object from JSON data
  factory Meeting.fromJson(Map<String, dynamic> json) {
    return Meeting(
      id: json['id'] ?? 0,
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      counterDate: json['counter_date'] != null
          ? DateTime.parse(json['counter_date'])
          : null,
      acceptedCompany: json['accepted_company'],
      acceptedApprentice: json['accepted_apprentice'],
      validateCompany: json['validate_company'],
      validateApprentice: json['validate_apprentice'],
      refused: json['refused'],
      creationDate: json['creation_date'] != null
          ? DateTime.parse(json['creation_date'])
          : null,
      type: json['type'],
      applyDemandId: json['apply_demand_id'],
    );
  }

  // Method to convert Meeting object to JSON data
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date?.toIso8601String(),
      'counter_date': counterDate?.toIso8601String(),
      'accepted_company': acceptedCompany,
      'accepted_apprentice': acceptedApprentice,
      'validate_company': validateCompany,
      'validate_apprentice': validateApprentice,
      'refused': refused,
      'creation_date': creationDate?.toIso8601String(),
      'type': type,
      'apply_demand_id': applyDemandId,
    };
  }
}
