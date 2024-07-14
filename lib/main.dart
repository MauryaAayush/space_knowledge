import 'package:flutter/material.dart';

import 'Views/HomeScreen/home_screen.dart';
import 'Views/Splash&intro_screen/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Splashscreen()
    );
  }
}
