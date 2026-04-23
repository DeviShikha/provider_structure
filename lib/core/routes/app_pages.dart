import 'package:flutter/cupertino.dart';

import '../../presentation/splash_scr/splash_scr.dart';
import 'app_routes.dart';

class AppPages {
  static Map<String, WidgetBuilder> get routes => {
    AppRoutes.splashScr: (context) => SplashScr(),
  };
}