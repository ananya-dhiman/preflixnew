import 'package:flutter/material.dart';
import 'home.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Downloads(),
    );
  }
}

class Downloads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Movie reel icon
           const Icon(
              Icons.movie,
              color: Colors.yellow,
              size: 100,
            ),
            const SizedBox(height: 20),
            
          
          ],
        ),
      ),
    );
  }
}
