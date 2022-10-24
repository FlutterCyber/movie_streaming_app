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
            color: Colors.black,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            margin: EdgeInsets.only(top: 120),
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(30),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
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
                    margin: const EdgeInsets.only(top: 60, bottom: 10),
                    height: 100,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  // select(context);
                },
              ),
              Text(
                "Lorem Ipsum",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Lorem Ipsum",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(
                height: 8,
              ),
              buildcontainer("Settings", doit, textcontroller),
              buildcontainer("Notifications", doit, textcontroller),
            ],
          )
        ],
      ),
    );
  }

  Widget buildcontainer(
      String str, void doit, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 10,bottom: 10,top: 10),
      padding: EdgeInsets.only(right: 15, left: 20),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            str,
            style: TextStyle(fontSize: 18),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))
        ],
      ),
    );
  }
}
/*Container(
        margin: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15,
          ),
          color: Colors.red.withOpacity(
            0.2,
          ),
          border: Border.all(
            color: Colors.red,
          ),
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: str,
            hintStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            border: InputBorder.none,
          ),
          textAlign: TextAlign.center,
        ),
      )*/
