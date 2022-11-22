import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b333e),
      // appBar: AppBar(
      //   //backgroundColor: const Color(0xff2b333e),
      //   backgroundColor: Colors.black.withOpacity(0.56),
      //   centerTitle: true,
      //   elevation: 5,
      //   title: const Text("Account", style: TextStyle(fontSize: 20)),
      // ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/img_4.png"), fit: BoxFit.cover),
        ),
        child: GlassmorphicContainer(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          borderRadius: 0,
          blur: 10,
          // blur xiralik darajasi
          alignment: Alignment.center,
          border: 1,
          linearGradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(
                0.4,
              ),
              Colors.black.withOpacity(
                0.4,
              ),
            ],
          ),
          borderGradient: LinearGradient(
            colors: [
              const Color(0x00000000).withOpacity(0.3),
              const Color((0x000000)).withOpacity(0.3),
            ],
          ),
          child: Column(
            /// mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                height: MediaQuery.of(context).size.height * 0.23,
                width: MediaQuery.of(context).size.width * 0.46,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTt0yboM1y3PKIke01cHJpc0V7j-LAmoZ4PkQ&usqp=CAU"),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "UserName",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                "UserEmail",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              // GlassmorphicContainer(
              //   width: MediaQuery.of(context).size.width * 0.8,
              //   height: MediaQuery.of(context).size.height * 0.07,
              //   borderRadius: 10,
              //   linearGradient: LinearGradient(colors: [
              //     Colors.white.withOpacity(0.12),
              //     Colors.white.withOpacity(0.12),
              //   ]),
              //   border: 0,
              //   blur: 4,
              //   borderGradient: LinearGradient(colors: []),
              //   child: Text(
              //     "data 12312 1",
              //     style: TextStyle(color: Colors.red),
              //   ),
              // ),
              /// textbutton history
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [
                      Colors.white.withOpacity(0.1),
                      Colors.white.withOpacity(0.1),
                    ])),
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.history,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "History",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),

              /// language buttom
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [
                      Colors.white.withOpacity(0.1),
                      Colors.white.withOpacity(0.1),
                    ])),
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.language,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Language",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              ///uplode page buttom
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [
                      Colors.white.withOpacity(0.1),
                      Colors.white.withOpacity(0.1),
                    ])),
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.cloud_upload_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Uploade Page",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
