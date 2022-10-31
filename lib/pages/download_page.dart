import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:movie_streaming_app/models/download_model.dart';

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
      name: "Forrest Gump",
      age: "1994",
      type: "Romantika/Drama",
      movieimg:"https://cdn.chili.com/images/public/cms/f8/1f/67/81/f81f6781-1ff0-46c7-befe-7c9f5d010e01.jpg?width=616");
      var movie2 = DownloadModel(
      name: "Forrest Gump",
      age: "1994",
      type: "Romantika/Drama",
      movieimg:"https://cdn.chili.com/images/public/cms/f8/1f/67/81/f81f6781-1ff0-46c7-befe-7c9f5d010e01.jpg?width=616");
  var movie3 = DownloadModel(
      name: "Forrest Gump",
      age: "1994",
      type: "Romantika/Drama",
      movieimg: "https://cdn.chili.com/images/public/cms/f8/1f/67/81/f81f6781-1ff0-46c7-befe-7c9f5d010e01.jpg?width=616");
  var movie4 = DownloadModel(
      name: "Forrest Gump",
      age: "1994",
      type: "Romantika/Drama",
      movieimg: "https://cdn.chili.com/images/public/cms/f8/1f/67/81/f81f6781-1ff0-46c7-befe-7c9f5d010e01.jpg?width=616");
  var movie5 = DownloadModel(
      name: "Forrest Gump",
      age: "1994",
      type: "Romantika/Drama",
      movieimg: "https://cdn.chili.com/images/public/cms/f8/1f/67/81/f81f6781-1ff0-46c7-befe-7c9f5d010e01.jpg?width=616");
  var movie6 = DownloadModel(
      name: "Forrest Gump",
      age: "1994",
      type: "Romantika/Drama",
      movieimg:"https://cdn.chili.com/images/public/cms/f8/1f/67/81/f81f6781-1ff0-46c7-befe-7c9f5d010e01.jpg?width=616");

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
        backgroundColor: Colors.black.withOpacity(0.56),
        centerTitle: true,
        elevation: 5,
        title: const Text("Downloads", style: TextStyle(fontSize: 20)),
      ),
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
          child: ListView.builder(
              itemCount: lst.length,
              itemBuilder: (ctx, i) {
                return itemoflst(lst[i]);
              }),
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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        movie.movieimg,
                      ),
                    )),
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
                       movie.type,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      movie.age,
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
