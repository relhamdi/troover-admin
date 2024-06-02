class ApiUtils {
  static Map<String, String> getHeaders([Map<String, String>? extra]) {
    extra = extra ?? {};
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      ...extra,
    };
  }
}
