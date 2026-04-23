import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_structure/presentation/screens/home_provider.dart';
import 'package:provider_structure/presentation/screens/home_screen.dart';
import 'package:provider_structure/presentation/splash_scr/splash_provider.dart';
import 'package:provider_structure/presentation/splash_scr/splash_scr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider(), child: SplashScr(),),
        ChangeNotifierProvider(create: (_) => CounterProvider() , child:  HomeScreen(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScr(),
      ),
    );
  }
}