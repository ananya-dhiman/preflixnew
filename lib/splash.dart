import 'package:flutter/material.dart';
import 'home.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
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
            
            // App title
            const Text(
              'PREFLIX',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 40),
            
            // Play button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: const EdgeInsets.all(20),
                backgroundColor: Colors.black,
                side: const BorderSide(color: Colors.yellow, width: 2),
              ),
               onPressed: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Page2(), // Make sure Page6 is defined and imported
                            ),
                        );
               },
              child: const Icon(Icons.play_arrow, color: Colors.yellow, size: 30),
            ),
            const SizedBox(height: 20),
            
            // Subtitle text
            const Text(
              'Watch your favourite movies and shows now!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
