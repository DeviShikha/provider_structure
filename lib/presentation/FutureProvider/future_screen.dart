import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../StreamProvider/stream_screen.dart';

class MyFutureScreen extends StatelessWidget {
  const MyFutureScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final data = context.watch<String?>();

    return Scaffold(
      appBar: AppBar(title: const Text("FutureProvider Example")),

      body: Column(
        children: [
          Center(
            child: Text(
              data ?? "No Data",
              style: const TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.orange
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => const MyStreamScreen()));
              }, child: Text("Next Screen"))
        ],
      ),
    );
  }
}
