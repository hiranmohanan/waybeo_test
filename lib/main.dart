import 'package:flutter/material.dart';
import 'package:waybeo_app/experiment.dart';
import 'package:waybeo_app/splash.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: tabletasks(),
    );
  }
}