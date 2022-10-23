import 'package:flutter/material.dart';
import 'package:movie_streaming_app/pages/home_page.dart';
import 'package:movie_streaming_app/pages/lottie_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LottiePage(),
      routes: {
        HomePage.id:(context) => HomePage(),
      },
    );
  }
}
