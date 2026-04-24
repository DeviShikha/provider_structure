import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_structure/presentation/FutureProvider/future_screen.dart';
import 'changenotifire_provider.dart';

class Change extends StatelessWidget {
  const Change({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("ChangeNotifierProvider")),
      body: Column(
        children: [
          Center(
            child: Text(
              context.watch<Changenotifire>().count.toString(),
              style: const TextStyle(fontSize: 30),
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
              Navigator.push(context, MaterialPageRoute(builder: (_) => const MyFutureScreen()));
          }, child: Text("Next Screen"))
        ],
      ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: "increment",
              onPressed: () {
                context.read<Changenotifire>().increment();
              },
              child: const Icon(Icons.add),
            ),
             SizedBox(height: 10),
            FloatingActionButton(
              heroTag: "decrement",
              onPressed: () {
                context.read<Changenotifire>().decrement();
              },
              child: const Icon(Icons.remove),
            ),
          ],
        )
    );
  }
}