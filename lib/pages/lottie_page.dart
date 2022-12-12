import 'package:firedart/auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_streaming_app/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LottiePage extends StatefulWidget {
  static const String id = "lottie_page";

  const LottiePage({Key? key}) : super(key: key);

  @override
  State<LottiePage> createState() => _LottiePageState();
}

class _LottiePageState extends State<LottiePage> {
  final auth = FirebaseAuth.instance;

  Future login() async {
    final prefs = await SharedPreferences.getInstance();
    String email = prefs.getString("email")!;
    String password = prefs.getString("password")!;
    auth.signIn(email, password).then((value) {
      Navigator.pushReplacementNamed(context, HomePage.id);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          "assets/lotties/movie.json",
        ),
      ),
    );
  }
}
