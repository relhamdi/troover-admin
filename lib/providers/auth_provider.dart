import 'package:flutter/material.dart';
import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/services/base_service.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  User? _user;

  String? get token => _token;
  User? get connectedUser => _user;

  Future<void> login(String email, String password) async {
    _token = await ApiService.auth.login(email, password);
  }

  Future<void> setUserSession(String token) async {
    _token = token;
    _user = await ApiService.auth.getConnectedUserInfo(token);
    notifyListeners();
  }

  void logout(context) {
    _token = null;
    _user = null;
    notifyListeners();
  }

  bool isLoggedIn() {
    return _token != null;
  }
}
