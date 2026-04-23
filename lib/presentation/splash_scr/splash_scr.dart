import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_structure/presentation/splash_scr/splash_provider.dart';
import 'package:provider_structure/presentation/screens/home_screen.dart';

class SplashScr extends StatefulWidget {
  const SplashScr({super.key});

  @override
  State<SplashScr> createState() => _SplashScrState();
}

class _SplashScrState extends State<SplashScr> {
  @override
  void initState() {
    super.initState();
    // Start initialization when the screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashProvider>().initializeApp();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Listen for completion
    final isLoading = context.select((SplashProvider p) => p.isLoading);

    if (!isLoading) {
      // Navigate to home screen once loading is done
      Future.microtask(() {
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) =>  HomeScreen()),
          );
        }
      });
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(size: 100),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
            const SizedBox(height: 10),
            const Text("Initializing App..."),
          ],
        ),
      ),
    );
  }
}
