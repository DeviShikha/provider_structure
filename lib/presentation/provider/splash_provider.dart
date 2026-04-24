import 'package:flutter/material.dart';
import '../ListenableProvider/h_screen.dart';

class SplashProvider {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  Future<void> initializeApp(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    _isLoading = false;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => MyHomeScreen()),
    );
  }
}
