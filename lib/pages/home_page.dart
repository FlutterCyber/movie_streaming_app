import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Text("Home Page",style: TextStyle(color: Colors.black),),
      ),
    );
=======
    return Container();
>>>>>>> origin/master
  }
}
