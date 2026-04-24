import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_structure/presentation/ChangeNotifierProvider/chengenotifireprovider.dart';
import 'package:provider_structure/presentation/ListenableProvider/h_provider.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("ListenableProvider"),),
      body: Center(
        child: Column(
          children: [
            Text(
              "Count: ${context.watch<HProvider>().value}",
              style: const TextStyle(fontSize: 24),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: context.read<HProvider>().decrement,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: context.read<HProvider>().increment,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 50,
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.orange
                ),
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => const Change()));
            }, child: Text("Next Screen")),
          ),
        ),
      ),
    );
  }
}
