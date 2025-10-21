import 'package:flutter/material.dart';

class UserManager extends ChangeNotifier {
  // Authenticated user
  dynamic _auth_user;
  dynamic get auth_user => _auth_user;

  void update_auth_user(dynamic user) {
    _auth_user = user;
    notifyListeners();
  }
}
