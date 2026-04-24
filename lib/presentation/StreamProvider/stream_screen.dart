import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ValueListenableProvider/valuelisten_screen.dart';

class MyStreamScreen extends StatelessWidget {
  const MyStreamScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("StreamProvider Example")),

      body: Column(
        children: [
          Center(
            child: Text(
              "Count: ${context.watch<int?>()}",
              style: const TextStyle(fontSize: 25),
            ),
          ),
          SizedBox(height: 30,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.orange
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => const LightScreen()));
              }, child: Text("Next Screen")),
        ],
      ),
    );
  }
}