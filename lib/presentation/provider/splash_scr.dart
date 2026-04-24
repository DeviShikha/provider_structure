import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_structure/presentation/provider/splash_provider.dart';

class SplashScr extends StatelessWidget {
  const SplashScr({super.key});

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashProvider>().initializeApp(context);
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(height: 20),
            CircularProgressIndicator(),
            SizedBox(height: 10),
            Text("Initializing App..."),
          ],
        ),
      ),
    );
  }
}