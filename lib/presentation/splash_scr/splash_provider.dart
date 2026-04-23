import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class SplashProvider extends ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  Future<void> initializeApp(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    _isLoading = false;
    notifyListeners();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }
}
