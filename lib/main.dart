import 'package:fizzbuzz_app/app.dart';
import 'package:flutter/material.dart';
import 'package:fizzbuzz_app/injection_container.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}
