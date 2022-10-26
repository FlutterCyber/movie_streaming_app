import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_streaming_app/pages/home_page.dart';
import 'package:movie_streaming_app/pages/login_pages/sing%20in.dart';

class LottiePage extends StatefulWidget {
  static const String id = "lottie_page";

  const LottiePage({Key? key}) : super(key: key);

  @override
  State<LottiePage> createState() => _LottiePageState();
}

class _LottiePageState extends State<LottiePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer();
  }

  void _timer() {
    // 1 second = 1000 millisecond
    Timer(Duration(milliseconds: 5000),(){
      Navigator.pushReplacementNamed(context, SignInPage.id);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/lotties/movie.json"),
      ),
    );
  }
}
