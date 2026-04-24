import 'package:flutter/material.dart';

class LightProvider extends ValueNotifier<bool> {
  LightProvider() : super(false);

  void toggle() {
    value = !value;
  }
}