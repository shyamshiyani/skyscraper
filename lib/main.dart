import 'package:flutter/material.dart';
import 'package:sky_scraper/Views/Pages/Home_page.dart';
import 'package:sky_scraper/Views/Pages/Splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "Splash_Screen",
      routes: {
        '/': (context) => const HomeScreen(),
        'Splash_Screen': (context) => const SplashScreen(),
      },
    ),
  );
}
