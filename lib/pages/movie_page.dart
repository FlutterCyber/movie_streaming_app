import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class MoviePage extends StatefulWidget {
  static const String id = "page";

  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  PageController controller = PageController();
  int currentIndex = 0;
  int categoryIndex = 0;
  bool isWorked = false;
  List<String> images = [
    "assets/images/img_1.png",
  ];
  String description = "This movie is one of the best movies.";
  String name = "The name of the movie the of the";

  String year="2022";
  String time="2 h 32 m";
  String janr="Adventure";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xff38404b),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      images[0],
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Color(0xff38404b).withOpacity(0.4),
                            Color(0xff38404b).withOpacity(0.6),
                            Color(0xff38404b).withOpacity(0.8),
                            Color(0xff38404b),
                            Color(0xff38404b),
                            Color(0xff38404b),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ////icon
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(
                                        () {
                                          isWorked = !isWorked;
                                        },
                                      );
                                    },
                                    child: const Icon(
                                      IconlyBold.play,
                                      color: Colors.red,
                                      size: 50,

                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2,
                            ),
                            /////name movie
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Flexible(
                                      child: Text(
                                    name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                    ),
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            ),

                            /////data of the movie
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: Padding(
                                padding:
                                const EdgeInsets.only(left: 30, right: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                   Icon(IconlyBold.calendar,color: Colors.white,),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(year,style: TextStyle(color: Colors.white),),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("|",style: TextStyle(color: Colors.white),),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(IconlyBold.time_circle,color: Colors.white,),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(time,style: TextStyle(color: Colors.white),),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("|",style: TextStyle(color: Colors.white),),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(IconlyBold.video,color: Colors.white,),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(janr,style: TextStyle(color: Colors.white),),
                                    SizedBox(
                                      width: 5,
                                    ),

                                  ],
                                ),
                              ),
                            ),

                            /////// story line
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Story Line",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              IconlyLight.download,
                                              color: Colors.red,
                                              size: 28,
                                            )),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.share,
                                              color: Colors.red,
                                              size: 28,
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),

                            /////description
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      description,
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15,left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "The Cast",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),

                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                      color: Color(0xff38404b),
                      child: Row(
                        children: [
                          buildContainer("assets/images/img_1.png"),
                          buildContainer("assets/images/img_1.png"),
                          buildContainer("assets/images/img_1.png"),
                          buildContainer("assets/images/img_1.png"),
                          buildContainer("assets/images/img_1.png"),
                          buildContainer("assets/images/img_1.png"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContainer(String img_link) {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 10, bottom: 20),
      width: 75,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(img_link),
          )),
    );
  }
}
