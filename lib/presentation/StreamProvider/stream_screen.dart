import 'package:flutter/material.dart';
import 'package:provider_structure/presentation/StreamProvider/stream_provider.dart';
import '../ValueListenableProvider/valuelisten_screen.dart';

class MyStreamScreen extends StatelessWidget {
  const MyStreamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("StreamBuilder Example")),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: StreamBuilder<int>(
              stream: counterStream(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }

                return Text(
                  "Count: ${snapshot.data}",
                  style: const TextStyle(fontSize: 25),
                );
              },
            ),
          ),

          const SizedBox(height: 30),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.orange,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const LightScreen(),
                ),
              );
            },
            child: const Text("Next Screen"),
          ),
        ],
      ),
    );
  }
}
