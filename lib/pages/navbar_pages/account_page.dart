import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_streaming_app/pages/login_pages/start_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Account extends StatefulWidget {
  static const String id = "account_id";

  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String name = "";
  String mail = "";

  Future<void> userName() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      String? tempName = prefs.getString('name');
      String? tempMail = prefs.getString('email');
      setState(() {
        name = tempName!;
        mail = tempMail!;
      });
    } catch (e) {
      log("$e");
    }
  }

  Future signOut(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("email");
    prefs.remove("password");
    prefs.remove("logged");
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, StartPage.id);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userName();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/background.jpg",
              ),
              fit: BoxFit.cover),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 20,
              sigmaY: 20,
            ),
            child: SizedBox(
              height: height,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.2,
                    width: height * 0.2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(height * 0.2),
                      child: Image.asset("assets/images/user.png"),
                    ),
                  ),
                  const SizedBox(height: 16),
                  name != ""
                      ? Text(
                          name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        )
                      : const SizedBox.shrink(),

                  const SizedBox(height: 8),
                  mail == ""
                      ? const SizedBox.shrink()
                      : Text(
                          mail,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),

                  // const Text(
                  //   "mail@gmail.com",
                  //   style: TextStyle(
                  //     color: Colors.white70,
                  //     fontWeight: FontWeight.w700,
                  //     fontSize: 16,
                  //   ),
                  // ),
                  const SizedBox(height: 8),
                  widgetTile(
                      height, width, context, "Language", Icons.language),
                  widgetTile(height, width, context, "History", Icons.history),
                  widgetTile(
                      height, width, context, "Settings", Icons.settings),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget widgetTile(
      double height, double width, BuildContext context, String title, icon) {
    return Container(
      margin: const EdgeInsets.only(
        left: 36,
        right: 36,
        top: 8,
        bottom: 8,
      ),
      height: height * 0.08,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.red, size: 30),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
