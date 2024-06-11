import 'package:flutter/material.dart';
import 'package:ngajidong/pages/detail_screen.dart';
import 'package:ngajidong/pages/detail_screen_dzikir.dart';
import 'package:ngajidong/pages/home_screen.dart';
import 'package:ngajidong/pages/splash_screen.dart';
import 'package:ngajidong/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        useMaterial3: true
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName:(context) => const SplashScreen(),
        HomeScreen.routeName:(context) => const HomeScreen(),
        DetailScreen.routeName:(context) => DetailScreen(
          id_surah: ModalRoute.of(context)?.settings.arguments as String,
        ),
        DetailScreenDzikir.routeName:(context) => DetailScreenDzikir(
          id_dzikir: ModalRoute.of(context)?.settings.arguments as String,
        ),
      },
    );
  }
}
