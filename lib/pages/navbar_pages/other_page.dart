import 'package:flutter/material.dart';

class OtherPage extends StatefulWidget {
  static const String id = "dmvdmvidvefefefm";
  const OtherPage({Key? key}) : super(key: key);

  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "This is Another Page",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 20
          ),
        ),
      ),
    );
  }
}
