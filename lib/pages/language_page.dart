import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_streaming_app/pages/home_page.dart';
import 'package:movie_streaming_app/pages/navbar_pages/account_page.dart';

class LanguagePage extends StatefulWidget {
  static const String id = "ianucrw389c32c23c23rx32x";

  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.black,
       shadowColor: Colors.black,
       title: Text("Language".tr()),

      ),
      body: Container(
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
                  const SizedBox(height: 8),
                  widgetTile(
                    height,
                    width,
                    context,
                    "English",
                    "assets/icons/en.png",
                    "en",
                    "US"
                  ),
                  widgetTile(
                    height,
                    width,
                    context,
                    "Русский",
                    "assets/icons/ru.png",
                    "ru",
                    "BL"
                  ),
                  widgetTile(
                    height,
                    width,
                    context,
                    "O'zbek",
                    "assets/icons/uz.png",
                    "uz",
                    "UZ"
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget widgetTile(double height, double width, BuildContext context,
      String title, icon, String tr, String TR) {
    return GestureDetector(
      onTap:() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const HomePage(),
          ),
        );
       context.locale = Locale(tr,TR);
      },
      child: Container(
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: imageIcon(icon),
              ),
              const SizedBox(width: 20),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Expanded(child: SizedBox()),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageIcon(icon) {
    return ClipRRect(
      child: Image.asset(icon),
    );
  }

  void openLang() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const Account(),
      ),
    );
  }
}
