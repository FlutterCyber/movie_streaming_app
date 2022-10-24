import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Account extends StatefulWidget {
  static const String id = "account";

  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

TextEditingController textcontroller = TextEditingController();
TextEditingController logcontroller = TextEditingController();
TextEditingController passtcontroller = TextEditingController();
final pickimg = ImagePicker();
File? _image;

doit() {}

class _AccountState extends State<Account> {
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
  //
  // Future getImageCamera() async {
  //   final pickedFile = await pickimg.pickImage(source: ImageSource.camera);
  //   setState(() {
  //     if (pickedFile != null) {
  //       _image = File(pickedFile.path);
  //     } else {
  //       print("No image selected");
  //     }
  //   });
  // }
  // void select(BuildContext context) => showDialog(
  //   context: context,
  //   builder: (BuildContext context) {
  //     return SimpleDialog(
  //       title: Text("Choose"),
  //       children: <Widget>[
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             SimpleDialogOption(
  //               onPressed: () {
  //                 getImage();
  //                 Navigator.pushReplacementNamed(context, Account.id);
  //               },
  //               child: Column(
  //                 children: [
  //                   Icon(
  //                     Icons.image,
  //                     size: 25,
  //                   ),
  //                   SizedBox(
  //                     height: 15,
  //                   ),
  //                   Text("Galery", style: TextStyle(fontSize: 18)),
  //                 ],
  //               ),
  //             ),
  //             SizedBox(
  //               width: 20,
  //             ),
  //             SimpleDialogOption(
  //               onPressed: () {
  //                 getImageCamera();
  //                 Navigator.pushReplacementNamed(context, Account.id);
  //               },
  //               child: Column(
  //                 children: [
  //                   Icon(
  //                     Icons.camera_alt,
  //                     size: 25,
  //                   ),
  //                   SizedBox(
  //                     height: 15,
  //                   ),
  //                   Text("Camera", style: TextStyle(fontSize: 18)),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     );
  //   },
  // );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.green,
            width: double.infinity,
            height: double.infinity,

          ),
          Container(
            margin: EdgeInsets.only(top: 200),
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green.shade200,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    buildcontainer("User Name", doit(), textcontroller),
                    buildcontainer("Login", doit(), logcontroller),
                    buildcontainer("Parol", doit(), passtcontroller),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              GestureDetector(
                /// avatar photo
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 160),
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  // select(context);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildcontainer(
      String str, void doit, TextEditingController controller) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.green.withOpacity(0.2),
            border: Border.all(color: Colors.green)),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: str, border: InputBorder.none),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
