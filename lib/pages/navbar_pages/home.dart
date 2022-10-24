import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_streaming_app/screens/app_bar_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "jodfiejdf";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationX(pi),
          child: Image.asset(
            'assets/images/img_1.png',
            alignment: FractionalOffset.topCenter,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          color: Color(0xff1D1E33).withOpacity(0.8),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 20.0,
            sigmaY: 20.0,
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: CustomScrollView(
              slivers: [
                AppbarScreen(),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 2000,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  image() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationX(pi),
          child: Image.asset(
            'assets/images/img_1.png',
            alignment: FractionalOffset.topCenter,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget wheel() {
    return SliverToBoxAdapter(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width,
        child: ListWheelScrollView.useDelegate(
          itemExtent: 40,
          childDelegate: ListWheelChildBuilderDelegate(
              childCount: 10,
              builder: (context,index){
                return Text("$index dedededefc");
              }
          ),
        ),
      ),
    );
  }
}
