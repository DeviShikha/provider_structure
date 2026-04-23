import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  Future<void> initializeApp() async {
    // Simulate some initialization logic (e.g., fetching config, checking auth)
    await Future.delayed(const Duration(seconds: 3));
    _isLoading = false;
    notifyListeners();
  }
}
