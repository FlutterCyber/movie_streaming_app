import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_streaming_app/pages/login_pages/sign%20up.dart';
import 'package:movie_streaming_app/pages/login_pages/sing%20in.dart';

class StartPage extends StatefulWidget {
  static const String id = "StartPage";

  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int index = 0;
  String logo = "WatchMe";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b333e),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "assets/images/background.jpg",
              fit: BoxFit.cover,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 15,
              sigmaY: 15,
            ),
            child: Container(
              padding: const EdgeInsets.only(),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff16172B).withOpacity(0.5),
                    Color(0xff16172B).withOpacity(0.5),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50, left: 30, bottom: 20),
                child: Text(
                  logo,
                  style: GoogleFonts.aBeeZee(
                      fontSize: 25,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: PageViewWidget(),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///arrow container
              Container(
                padding: EdgeInsets.all(10),
                child: Icon(
                  IconlyBold.arrow_right_3,
                  size: 25,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white38, width: 2),
                    borderRadius: BorderRadius.circular(30)),
              ),
              SizedBox(
                height: 12,
              ),

              Text(
                "See what's next.",
                style: GoogleFonts.aBeeZee(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "WatchMe shows and movies anytime anywhere and whenever you wont.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff757c86),
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 50, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //SignUP
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, SignUpPage.id);
                      },
                      child: Container(
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 2,
                            color: Colors.white38,
                          ),
                        ),
                        child: Center(
                            child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    //SignIN
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, SignInPage.id);
                      },
                      child: Container(
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                            child: Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

/////PAGE builder

class PageViewWidget extends StatefulWidget {
  static const String id = "page_view";

  const PageViewWidget({Key? key}) : super(key: key);

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  String _textdata = "Lorem Ipsum,Lorem Ipsum";

  List _list = [
    "assets/images/start1.jpg",
    "assets/images/start2.jpg",
    "assets/images/start3.jpg",
  ];
  List nameofmov = ["House of Cards", "Peaky Blinders", "Red Notice"];

  PageController pageController = new PageController();

  double viewportFraction = 0.8;

  late double pageoffset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController =
        PageController(initialPage: 0, viewportFraction: viewportFraction)
          ..addListener(() {
            setState(() {
              pageoffset = pageController.page!;
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: pageController,
        itemCount: _list.length,
        itemBuilder: (context, index) {
          double scale = max(viewportFraction,
              (1 - (pageoffset - index).abs()) + viewportFraction);

          double angle = (pageoffset - index).abs();

          if (angle > 0.5) {
            angle = 1 - angle;
          }

          return Container(
            padding: EdgeInsets.only(
              right: 20,
              left: 10,
              top: 100 - scale * 50,
            ),
            child: Column(
              children: [
                Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0)
                    ..rotateY(angle),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.red.withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 20,
                                offset: Offset(5, 5)),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            _list[index],
                            fit: BoxFit.cover,
                            height: 300,
                            width: 200,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Text(
                          nameofmov[index],
                          style: GoogleFonts.aBeeZee(
                              fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
