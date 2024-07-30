import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scraper/Views/Pages/Detail_page.dart';
import 'package:sky_scraper/Views/Pages/Home_page.dart';
import 'package:sky_scraper/Views/Pages/Splash_screen.dart';

import 'Controller/Theme_Povider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeNotifier(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          theme: themeNotifier.themeData,
          debugShowCheckedModeBanner: false,
          initialRoute: 'Splash_Screen',
          routes: {
            '/': (context) => const HomeScreen(),
            'Splash_Screen': (context) => const SplashScreen(),
            'Detail_screen': (context) => const DetailPage(),
          },
        );
      },
    );
  }
}
