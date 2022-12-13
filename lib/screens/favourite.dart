import 'dart:developer';
import 'dart:ui';

import 'package:firedart/firestore/models.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Favourite extends StatefulWidget {
  const Favourite({required this.id, required this.movie, Key? key})
      : super(key: key);
  final String id;
  final Document movie;

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  bool isLiked = false;

  Future getLike() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      bool liked = preferences.getBool(widget.id)!;
      setState(() {
        isLiked = liked;
      });
    } catch (e) {
      log("$e");
    }
  }

  Future likeBos() async {
    setState(() {
      isLiked = !isLiked;
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(widget.id, isLiked);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLike();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        likeBos();
        if (isLiked) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                'Movie successfully added your favorites!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'Movie successfully deleted your favorites!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
      },
      child: SizedBox(
        //height: height * 0.08,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaY: 10,
              sigmaX: 10,
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: isLiked
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
