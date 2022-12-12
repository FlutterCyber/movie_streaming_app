import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_streaming_app/pages/login_pages/start_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

Future signOut(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove("email");
  prefs.remove("password");
  prefs.remove("logged");
  Navigator.pushReplacementNamed(context, StartPage.id);
}

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
            margin: const EdgeInsets.only(top: 120),
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
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
              const Text(
                "Lorem Ipsum",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Lorem Ipsum",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              buildcontainer("Settings", null, textcontroller),
              buildcontainer("Notifications", null, textcontroller),
              ListTile(
                leading: const Icon(
                  Icons.exit_to_app_sharp,
                  color: Colors.red,
                ),
                title: const Text(
                  "Sign out",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  signOut(context);
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
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 10),
      padding: const EdgeInsets.only(right: 15, left: 20),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            str,
            style: const TextStyle(fontSize: 18),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios))
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
