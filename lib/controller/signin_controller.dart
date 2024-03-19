import 'package:flutter/material.dart';

class SignInController extends ChangeNotifier {
  bool _isSignedIn = false;

  bool get isSignedIn => _isSignedIn;

  void setIsSignedIn(bool value) {
    _isSignedIn = value;
    notifyListeners();
  }
}
