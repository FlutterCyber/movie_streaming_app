import 'package:flutter/material.dart';
import 'package:movie_streaming_app/pages/home_page.dart';
import 'package:movie_streaming_app/pages/login_pages/sign%20up.dart';
import 'package:movie_streaming_app/pages/login_pages/sing%20in.dart';
import 'package:movie_streaming_app/pages/login_pages/start_page.dart';
import 'package:movie_streaming_app/pages/movie_page.dart';

class AllPage extends StatefulWidget {
  static const String id = "4hi3ui5";

  const AllPage({Key? key}) : super(key: key);

  @override
  State<AllPage> createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 200,),
              button("Sign In", const SignInPage()),
              button("Sign Up", const SignUpPage()),
              button("Start Page", const StartPage()),
              button("Home Page", const HomePage()),
              button("Movie Page", const MoviePage()),
            ],
          ),
        ),
      ),
    );
  }

  Widget button(String title, onTap) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => onTap),
        );
      },
      child: Text(title),
    );
  }
}
