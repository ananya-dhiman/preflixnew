import 'package:flutter/material.dart';
import 'splash.dart';
import 'home.dart';
import 'search.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PreFlix',
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
      '/splash':(context)=> const Page1(),
      '/home':(context)=> const Page2(),
      '/search':(context)=> const Page3(),


      }
    );
      
}
}
