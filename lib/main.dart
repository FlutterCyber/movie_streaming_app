import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:movie_streaming_app/pages/login_pages/sign_up.dart';
import 'package:movie_streaming_app/pages/login_pages/sing_in.dart';
import 'package:movie_streaming_app/pages/lottie_page.dart';
import 'package:movie_streaming_app/pages/navbar_pages/download_page.dart';
import 'package:movie_streaming_app/pages/home_page.dart';
import 'package:movie_streaming_app/pages/login_pages/start_page.dart';
import 'package:movie_streaming_app/pages/navbar_pages/home.dart';
import 'package:movie_streaming_app/pages/navbar_pages/playlist.dart';
import 'package:movie_streaming_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  FirebaseAuth.initialize(apiKey, VolatileStore());
  Firestore.initialize(projectID);
  await FlutterDownloader.initialize(debug: true);
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale("en", "US"),
        Locale("uz", "UZ"),
        Locale("ru", "BL"),
      ],
      path: "assets/translations",
      fallbackLocale: const Locale("en", "US"),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MoviesProvider(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

const apiKey = "AIzaSyCm8YgKr81h1y7O5JtVo1a1CogERPxdjyE";
const projectID = "watch-me-3c437";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WatchMe Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xff38404b).withOpacity(0.8),
        ),
      ),
      home: startPage(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routes: {
        //  MoviePage.id: (context) => const MoviePage(),
        StartPage.id: (context) => const StartPage(),
        HomePage.id: (context) => const HomePage(),
        HomeScreen.id: (context) => const HomeScreen(),
        PlaylistPage.id: (context) => const PlaylistPage(),
        SignInPage.id: (context) => const SignInPage(),
        SignUpPage.id: (context) => const SignUpPage(),
        DownloadPage.id: (context) => const DownloadPage(),
      },
    );
  }

  Widget startPage() {
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            try {
              if (snapshot.data!.getBool('logged')!) {
                return const LottiePage();
              } else {
                return const StartPage();
              }
            } catch (e) {
              log(e.toString());
              return const StartPage();
            }
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Unknown Error!"),
            );
          } else {
            return const StartPage();
          }
        });
  }
}

/// Widget _startPage() {
//     return StreamBuilder(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (BuildContext context, snapshot) {
//         if (snapshot.hasData) {
//           Prefs.saveUserId(snapshot.data!.uid);
//           return HomePage();
//         } else {
//           Prefs.removeUserId();
//           return SignInPage();
//         }
//       },
//     );
//   }
