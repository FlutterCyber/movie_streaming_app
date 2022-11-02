import 'dart:async';

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:movie_streaming_app/pages/login_pages/sing%20in.dart';

class SignUpPage extends StatefulWidget {
  static const String id = "eoitmgcuqef9043mc3nt5n769bh9h9786hb";

  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var namecontrol = TextEditingController();
  var emailcontrol = TextEditingController();
  var passwordcontrol1 = TextEditingController();
  var passwordcontrol2 = TextEditingController();
  bool hidetext1 = true;
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
      if (index < images.length-1) {
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
              image: AssetImage(
                images[index]
              ),
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
                  "Sign Up",
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
                // glass Morphizm Container hieght
                height: MediaQuery.of(context).size.height * 0.53,

                child: GlassmorphicContainer(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.7,
                  borderRadius: 15,
                  blur: 4,
                  // blur xiralik darajasi
                  alignment: Alignment.center,
                  border: 0.0,
                  linearGradient: LinearGradient(
                    colors: [
                      const Color(0xffffffff).withOpacity(
                        0.1,
                      ),
                      const Color(0xffffffff).withOpacity(
                        0.1,
                      ),
                    ],
                  ),
                  // borderGradient: LinearGradient(
                  //   colors: [
                  //     const Color(0x00000000).withOpacity(0.3),
                  //     const Color((0x000000)).withOpacity(0.3),
                  //   ],
                  // ),
                  // sign in UI
                  borderGradient: const LinearGradient(
                    colors: [],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.027,
                      ),
                      // Full name
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
                          controller: namecontrol,
                          //obscureText: false, textni yashirish
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            hintText: "FullName",
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
                      // Email
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
                      //password
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
                          controller: passwordcontrol1,
                          obscureText: hidetext1,
                          //textni yashirish
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidetext1 = !hidetext1;
                                });
                              },
                              icon: hidetext1
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: Colors.grey,
                                    )
                                  : Icon(Icons.visibility,color: Colors.grey,),
                            ),
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
                      //conform password
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
                          controller: passwordcontrol2,
                          obscureText: hidetext1, //textni yashirish
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            hintText: "Confirm password",
                            // suffixIcon: IconButton(
                            //   onPressed: () {
                            //     setState(() {
                            //       hidetext2 = !hidetext2;
                            //     });
                            //   },
                            //   icon: hidetext2
                            //       ? Icon(
                            //     Icons.visibility_off,
                            //     color: Colors.grey,
                            //   )
                            //       : Icon(Icons.visibility,color: Colors.grey,),
                            // ),
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
                          onPressed: () {},
                          child: const Text(
                            "Continue",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
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
                              "Already have an account?",
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
                                  SignInPage.id,
                                );
                              },
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.02,
                      // ),
                      // Center(
                      //   child: GestureDetector(
                      //     onTap: () {},
                      //     child: const Text(
                      //       "Forgot your password?",
                      //       style: TextStyle(
                      //         color: Colors.red,
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.w600,
                      //       ),
                      //     ),
                      //   ),
                      // ),
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
