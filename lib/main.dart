import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_structure/presentation/FutureProvider/future_provider.dart';
import 'package:provider_structure/presentation/ListenableProvider/h_provider.dart';
import 'package:provider_structure/presentation/StreamProvider/stream_provider.dart';
import 'package:provider_structure/presentation/ValueListenableProvider/valueList_provider.dart';
import 'package:provider_structure/presentation/provider/splash_provider.dart';
import 'package:provider_structure/presentation/provider/splash_scr.dart';
import 'package:provider_structure/presentation/ChangeNotifierProvider/changenotifire_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //// provider
        Provider(create: (_) => SplashProvider()),
        //// ListenableProvider
        ListenableProvider(create: (_) => HProvider()),
        //// changeNotifierProvider
        ChangeNotifierProvider(create: (_) => Changenotifire()),
        //// futureProvider
        FutureProvider<String?>(create: (_) => fetchData(), initialData: 'Loading...'),
        //// streamProvider
        StreamProvider<int?>(create: (_) => counterStream(), initialData: 0),
        //// valueProvider
        ChangeNotifierProvider(create: (_) => LightProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScr(),
        // home: MySplaceScreen(),
      ),
    );
  }
}
