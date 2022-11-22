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
  String description =
      """Не получив систематического образования, Чарльз Форт переменил много специальностей, подрабатывал журналистом, пытался реализовать себя как писатель, чему способствовало начавшееся в 1905 году знакомство с Теодором Драйзером, дружба с которым продолжалась до конца жизни Форта. При поддержке Драйзера Ч. Форту удалось опубликовать роман «Производители изгоев» (1909), который не имел успеха. Получив в 1916 году наследство, Чарльз Форт полностью посвятил себя сплошному просмотру периодических изданий США и Великобритании в поисках историй о предметах и животных, якобы, падавших с неба, спонтанных случаях самовозгорания человека, экстрасенсорных способностях и т. д. В 1919 году Форт напечатал первый из четырёх своих сборников""";
  String name = "The name of the movie the of the";

  String year = "2022";
  String time = "2 h 32 m";
  String janr = "Adventure";
  bool isreadmore = false;
  String rate="8.5";

  @override
  Widget build(BuildContext context) {
    Icon like_light = Icon(
      Icons.favorite_border,
      color: Colors.red,
    );
    Icon like_bold = Icon(
      Icons.favorite,
      color: Colors.red,
    );
    bool isliked = false;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xff38404b),
              child: Column(
                children: [
                  SizedBox(
                    height: isreadmore ? _height : _height * 0.85,
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                ),
                                /////name movie
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
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

                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(IconlyBold.star,color: Colors.amber,size: 20,),
                                      Text(" $rate")
                                    ],
                                  ),
                                ),

                                /////data of the movie
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          IconlyBold.calendar,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          year,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "|",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          IconlyBold.time_circle,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          time,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "|",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          IconlyBold.video,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          janr,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                /////// story line
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 15),
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
                                Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 30, right: 15),
                                      child: Text(
                                        description,
                                        maxLines: isreadmore ? 8 : 2,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          isreadmore = !isreadmore;
                                        });
                                      },
                                      child: Text(isreadmore
                                          ? "Read Less"
                                          : "Read More"),
                                    ),
                                  ],
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
                        padding: const EdgeInsets.only(right: 15, left: 30),
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
          ],
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
