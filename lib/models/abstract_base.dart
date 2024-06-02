abstract class JsonSerializable {
  JsonSerializable();

  // Factory constructor for creating an object from JSON data
  Map<String, dynamic> toJson();

  // Method to convert object to JSON data
  JsonSerializable.fromJson(Map<String, dynamic> json);
}
