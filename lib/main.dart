import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_knowledge/Providers/json_providing.dart';
import 'Views/Splash&intro_screen/splashScreen.dart';

void main() {
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => JsonProvider(),)
      ],
        child: const MyApp(),
      )
  );
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
