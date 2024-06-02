import 'package:troover_admin/models/_models.dart';

class Subscription extends JsonSerializable {
  int id;
  double price;
  bool showDemand;
  bool demandFilter;
  bool geoLocation;
  bool advancedDisplay;
  bool advancedDemandFilter;

  Subscription({
    required this.id,
    required this.price,
    required this.showDemand,
    required this.demandFilter,
    required this.geoLocation,
    required this.advancedDisplay,
    required this.advancedDemandFilter,
  });

  @override
  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      id: json['id'] ?? 0,
      price: json['price']?.toDouble() ?? 0,
      showDemand: json['showDemand'] ?? false,
      demandFilter: json['demandFilter'] ?? false,
      geoLocation: json['geoLocation'] ?? false,
      advancedDisplay: json['advancedDisplay'] ?? false,
      advancedDemandFilter: json['advancedDemandFilter'] ?? false,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'price': price,
      'show_demand': showDemand,
      'demandFilter': demandFilter,
      'geoLocation': geoLocation,
      'advancedDisplay': advancedDisplay,
      'advancedDemandFilter': advancedDemandFilter,
    };
  }
}
