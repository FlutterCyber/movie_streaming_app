import 'dart:async';
import 'dart:developer';

import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:movie_streaming_app/pages/home_page.dart';
import 'package:movie_streaming_app/pages/login_pages/sign%20up.dart';
import 'package:movie_streaming_app/screens/loading_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  static const String id = "wv937547534h8n";

  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var emailcontrol = TextEditingController();
  var passwordcontrol = TextEditingController();
  bool hidetext = true;
  int index = 0;
  List<String> images = [
    "assets/images/img_1.png",
    "assets/images/img_2.png",
    "assets/images/img_3.png",
    "assets/images/img_1.png",
    "assets/images/img_4.png",
    "assets/images/img_2.png",
    "assets/images/img_1.png",
    "assets/images/img_3.png"
  ];

  void slideshow() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (index < images.length - 1) {
        setState(() {
          index++;
        });
      } else {
        setState(() {
          index = 0;
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slideshow();
  }

  final auth = FirebaseAuth.instance;

  Future signIn() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white24,
            child: Center(
              child: Loading.loading(),
            ),
          );
        });
    final prefs = await SharedPreferences.getInstance();
    String email = emailcontrol.text.trim();
    String password = passwordcontrol.text.trim();
    try {
      await auth.signIn(email, password).then((value) {
        prefs.setString("password", password);
        prefs.setString("email", email);
        prefs.setBool("logged", true);
        setState(() {
          prefs.setBool("logged", true);
        });
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, HomePage.id);
      });
    } catch (e) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Error! Check your password or email and try again'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
            color: Colors.grey,
            image: DecorationImage(
              image: AssetImage(images[index]),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.27,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                ),
                child: const Text(
                  "Hi!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              // glassmorphizm UI
              Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.02,
                  right: MediaQuery.of(context).size.width * 0.02,
                ),
                height: MediaQuery.of(context).size.height * 0.52,
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.027,
                      ),
                      // email
                      Container(
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        height: MediaQuery.of(context).size.height * 0.068,
                        width: MediaQuery.of(context).size.width * 0.83,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            7,
                          ),
                        ),
                        child: TextField(
                          showCursor: true,
                          cursorColor: Colors.red,
                          textAlign: TextAlign.start,
                          controller: emailcontrol,
                          //obscureText: false, textni yashirish
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            hintText: "Email",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.022,
                      ),
                      // password
                      Container(
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        height: MediaQuery.of(context).size.height * 0.068,
                        width: MediaQuery.of(context).size.width * 0.83,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7)),
                        child: TextField(
                          showCursor: true,
                          cursorColor: Colors.red,
                          textAlign: TextAlign.start,
                          controller: passwordcontrol,
                          obscureText: hidetext,
                          //textni yashirish
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidetext = !hidetext;
                                  });
                                },
                                icon: hidetext
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.grey,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.grey,
                                      )),
                            hintText: "Password",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.022,
                      ),
                      //continue
                      Container(
                        height: MediaQuery.of(context).size.height * 0.068,
                        width: MediaQuery.of(context).size.width * 0.83,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(
                            7,
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            signIn();
                          },
                          child: const Text(
                            "Continue",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.015,
                          bottom: MediaQuery.of(context).size.height * 0.015,
                        ),
                        child: const Text(
                          "or",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                          ),
                        ),
                      ),
                      //google
                      Container(
                        height: MediaQuery.of(context).size.height * 0.068,
                        width: MediaQuery.of(context).size.width * 0.83,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            7,
                          ),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 33,
                              width: 33,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/icons/googleicon.png",
                                  ),
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Center(
                                child: Text(
                                  "Continue with Google",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 33,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.022,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                        width: MediaQuery.of(context).size.width * 0.83,
                        // color: Colors.lightBlue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  SignUpPage.id,
                                );
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "Forgot your password?",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
