import 'package:flutter/material.dart';

class AccPage extends StatefulWidget {
  static const String id = "dmvdmvidvm";
  const AccPage({Key? key}) : super(key: key);

  @override
  State<AccPage> createState() => _AccPageState();
}

class _AccPageState extends State<AccPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "Sardor Qo'shib Qo'yadi",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
