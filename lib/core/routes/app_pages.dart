import 'package:flutter/cupertino.dart';
import '../../presentation/provider/splash_scr.dart';
import 'app_routes.dart';

class AppPages {
  static Map<String, WidgetBuilder> get routes => {
    AppRoutes.splashScr: (context) => SplashScr(),
    // AppRoutes.homeScr: (context) => HomeScreen(),
  };
}