import 'package:flutter/material.dart';
// import 'package:movie_streaming_app/for%20test/timer_image.dart';
import 'package:movie_streaming_app/pages/download_page.dart';
// import 'package:movie_streaming_app/pages/hammasi%20shu%20yerda%20page.dart';
import 'package:movie_streaming_app/pages/home_page.dart';
import 'package:movie_streaming_app/pages/login_pages/sign%20up.dart';
import 'package:movie_streaming_app/pages/login_pages/sing%20in.dart';
import 'package:movie_streaming_app/pages/login_pages/start_page.dart';
import 'package:movie_streaming_app/pages/navbar_pages/home.dart';
import 'package:movie_streaming_app/pages/navbar_pages/playlist.dart';
// import 'package:movie_streaming_app/scroll_test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Movie App',
      theme: ThemeData(
       primarySwatch: Colors.red,
      ),
      home: const DownloadPage(),
      routes: {
        HomePage.id: (context) => const HomePage(),
        HomeScreen.id: (context) => const HomeScreen(),
        PlaylistPage.id: (context) => const PlaylistPage(),
        SignInPage.id: (context) => const SignInPage(),
        SignUpPage.id: (context) => const SignUpPage(),
        DownloadPage.id: (context) => const DownloadPage(),
      },
    );
  }
}

