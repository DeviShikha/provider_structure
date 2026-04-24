import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_structure/presentation/ValueListenableProvider/valueList_provider.dart';

class LightScreen extends StatelessWidget {
  const LightScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("ValueListenableProvider Example"),),

      body: Container(
        color: context.watch<LightProvider>().value ? Colors.yellow : Colors.black,
        child: Center(
          child: Text(
            context.watch<LightProvider>().value ? "Light ON 💡" : "Light OFF 🌙",
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        heroTag: "toggle",
        onPressed: () {
          context.read<LightProvider>().toggle();
        },
        child: const Icon(Icons.power_settings_new),
      ),
    );
  }
}