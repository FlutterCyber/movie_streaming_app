import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:movie_streaming_app/models/download%20model.dart';

class DownloadPage extends StatefulWidget {
  static const String id = "sefmegcierwgmcgqempgc34c5t9342";

  const DownloadPage({Key? key}) : super(key: key);

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _movieAdd();
  }

  var movie1 = DownloadModel(
      name: "lorem  sdfdsg df gd fg df gds fhv sd",
      chanel: "chanel",
      view: "100 views",
      movieAge: "1 oy oldin");
  var movie2 = DownloadModel(
      name: "lorem Imsum",
      chanel: "chanel",
      view: "100 views",
      movieAge: "1 oy oldin");
  var movie3 = DownloadModel(
      name: "lorem Imsum",
      chanel: "chanel",
      view: "100 views",
      movieAge: "1 oy oldin");
  var movie4 = DownloadModel(
      name: "lorem Imsum",
      chanel: "chanel",
      view: "100 views",
      movieAge: "1 oy oldin");
  var movie5 = DownloadModel(
      name: "lorem Imsum",
      chanel: "chanel",
      view: "100 views",
      movieAge: "1 oy oldin");
  var movie6 = DownloadModel(
      name: "lorem Imsum",
      chanel: "chanel",
      view: "100 views",
      movieAge: "1 oy oldin");
  List lst = [];

  _movieAdd() {
    lst.add(movie1);
    lst.add(movie2);
    lst.add(movie3);
    lst.add(movie4);
    lst.add(movie5);
    lst.add(movie6);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b333e),
      appBar: AppBar(
        //backgroundColor: const Color(0xff2b333e),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text("Downloads", style: TextStyle(fontSize: 20)),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/img_4.png"), fit: BoxFit.cover),
        ),
        child: GlassmorphicContainer(

        ),
      ),
    );
  }

  Widget itemoflst(DownloadModel movie) {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
      height: MediaQuery.of(context).size.height * 0.17,
      width: MediaQuery.of(context).size.width * 0.95,
      //color: Colors.grey,
      child: GlassmorphicContainer(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.17,
        borderRadius: 10,
        alignment: Alignment.topCenter,
        linearGradient: LinearGradient(colors: [
          Colors.white.withOpacity(0.1),
          Colors.white.withOpacity(0.1),
        ]),
        border: 0,
        blur: 2,
        borderGradient: const LinearGradient(colors: []),
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.155,
                width: MediaQuery.of(context).size.width * 0.41,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "https://avatars.mds.yandex.net/i?id=4161d62f7fffa6b6142136e3e115e742d8d9d88c-4078110-images-thumbs&n=13&exp=1",
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.155,
                width: MediaQuery.of(context).size.width * 0.41,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.name,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "@ " + movie.chanel,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      movie.view,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      movie.movieAge,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.19,
                ),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.069,
                color: Colors.white,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
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
