import 'package:flutter/cupertino.dart';

class HProvider extends ValueNotifier<int>{
  HProvider() : super(0);

  void increment() {
   value++;
  }

  void decrement() {
  value--;
  }
}
