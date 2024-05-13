import 'package:flutter/material.dart';
import 'package:mindwice/screens/Favourite_page.dart';
import 'package:mindwice/screens/festhomepage.dart';
import 'package:mindwice/screens/festivald_detailpage.dart';
import 'package:mindwice/screens/festivalpage.dart';
import 'package:mindwice/screens/festhomepage.dart';
import 'package:mindwice/screens/detail_page.dart';
import 'package:mindwice/screens/festpost_editpage.dart';
import 'package:mindwice/screens/login.dart';
import 'package:mindwice/screens/quote_page.dart';
import 'package:mindwice/screens/quotehome.dart';
import 'package:mindwice/screens/splace_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: "Keystone"),
    debugShowCheckedModeBanner: false,
    initialRoute: 'SplaceScreen',
    routes: {
      '/': (context) => const HomePage(),
      'Loginpage': (context) => const Loginpage(),
      'QuoteHomePage': (context) => const QuoteHomePage(),
      'SplaceScreen': (context) => const SplaceScreen(),
      'Detail_page': (context) => const Detail_page(),
      'Festivalpage': (context) => const Festivalpage(),
      'QuotePage': (context) => const QuotePage(),
      'festivalDetail': (context) => festivalDetail(),
      'FestEdit': (context) => FestEdit(),
      'FavouritePage': (context) => FavouritePage(),
    },
  ));
}
