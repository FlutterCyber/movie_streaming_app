import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPage extends StatefulWidget {
  static const String id = "add_page";

  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  DateTime date = DateTime.now();
  DateTime _date = DateTime.now();
  var year = DateTime.now().year;
 // File? _image;
  final pickimg = ImagePicker();

  var berilgansanaController = TextEditingController();
  // Future getImage() async {
  //   final pickedFile = await pickimg.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     if (pickedFile != null) {
  //       _image = File(pickedFile.path);
  //     } else {
  //       print("No image selected");
  //     }
  //   });
  // }
  selectdate() {
    showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1900),
        lastDate: DateTime(year))
        .then((value) => {
      setState(() {
        _date = value!;
        berilgansanaController.text =
        "${_date.day}.${_date.month}.${_date.year}";
      }),
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: Colors.red, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Icon(
                              Icons.video_collection_outlined,
                              size: 70,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: Colors.red, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Icon(
                              Icons.image_outlined,
                              size: 70,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //Name
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.1),
                          Colors.white.withOpacity(0.1),


                        ],
                      ),
                    ),
                    child: const Center(
                      child: TextField(
                        style: TextStyle(color: Colors.red),
                        decoration: InputDecoration(border: InputBorder.none,
                        hintText: "Name of movie",

                        hintStyle: TextStyle(color: Colors.grey)),

                      ),
                    ),
                  ),
                  //Janr
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.1),
                          Colors.white.withOpacity(0.1),


                        ],
                      ),
                    ),
                    child: const Center(
                      child: TextField(
                        style: TextStyle(color: Colors.red),
                        decoration: InputDecoration(border: InputBorder.none,
                            hintText: "Action",
                            hintStyle: TextStyle(color: Colors.grey)),

                      ),
                    ),
                  ),
                  //rate
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.1),
                          Colors.white.withOpacity(0.1),


                        ],
                      ),
                    ),
                    child: const Center(
                      child: TextField(
                        style: TextStyle(color: Colors.red),
                        decoration: InputDecoration(border: InputBorder.none,
                            hintText: "Rate",
                            hintStyle: TextStyle(color: Colors.grey)),

                      ),
                    ),
                  ),
                  //sanasi
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.1),
                          Colors.white.withOpacity(0.1),


                        ],
                      ),
                    ),
                    child: const Center(
                      child: TextField(
                        style: TextStyle(color: Colors.red),
                        decoration: InputDecoration(border: InputBorder.none,
                            hintText: "Date",
                            hintStyle: TextStyle(color: Colors.grey)),

                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
