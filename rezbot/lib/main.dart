import 'package:flutter/material.dart';
import 'package:rezbot/screens/splashscreen.dart';

import 'api/viam.dart';

void main() {
  runApp(const MyApp());
  ViamSetup().connectToViam();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
