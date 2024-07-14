import 'package:flutter/material.dart';
import 'dart:async';

import 'package:space_knowledge/Views/HomeScreen/home_screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    // Start a timer that navigates to the next screen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      // Navigator.pushReplacement(
      //   context,
        MaterialPageRoute(builder: (context) => const HomeScreen()); // Replace with your next screen
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            SizedBox(
                height: 250,
                width: 250,
                child: Image.asset(
                  'assets/images/Rectangle 29.png',
                  fit: BoxFit.cover,
                )),
            Image.asset('assets/images/Vector.png'),
            SizedBox(
              height: 10,
            ),
            Image.asset('assets/images/Knowledge.png'),
            Spacer(),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen(),));
                },

                child: Image.asset('assets/images/Button.png')),

            SizedBox(
              height: 40,
            )// Add some space below the button
          ],
        ),
      ),
    );
  }
}
