import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:logger/logger.dart';
import 'package:republic_on_volga/view/archive_page/archives_page.dart';
import 'package:republic_on_volga/view/contacts/contacts_page.dart';
import 'package:republic_on_volga/view/events_page/event_page.dart';
import 'package:republic_on_volga/view/events_page/events_page.dart';
import 'package:republic_on_volga/view/home_page/home_page.dart';
import 'package:republic_on_volga/view/home_page/last_news/detail_last_news.dart';
import 'package:republic_on_volga/view/home_page/tests/quiz_view.dart';
import 'package:republic_on_volga/view/lections_page/lections_page.dart';
import 'package:republic_on_volga/view/lections_page/master_class_page.dart';

import 'app_start.dart';
import 'data/resources.dart';
import 'view/lections_page/lection_page.dart';
import 'view/runes/runes_page.dart';

final log = Logger();

void main() async {
  await initApp();
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (BuildContext context) => HomePage(),
        '/events': (BuildContext context) => EventsPage(),
        '/runes': (BuildContext context) => RunesPage(),
        '/event': (BuildContext context) => EventPage(),
        '/detail_last_news': (BuildContext context) => DetailLastNews(),
        '/archive': (BuildContext context) => ArchivesPage(),
        '/quiz': (BuildContext context) => QuizView(),
        '/lections': (BuildContext context) => LectionsPage(),
        '/lection': (BuildContext context) => LectionPage(),
        '/master_class': (BuildContext context) => MasterClassPage(),
        '/contacts': (BuildContext context) => ContactsPage(),
      },
      title: 'Республика на Волге',
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: ColorScheme(
              primaryVariant: HexColor(primaryVariant),
              primary: HexColor(primaryColor),
              secondary: HexColor(secondaryColor),
              secondaryVariant: HexColor(secondaryVariant),
              surface: Colors.white,
              background: HexColor(backgroundColor),
              error: Colors.red,
              onPrimary: Colors.white,
              onSecondary: Colors.white,
              onSurface: HexColor(descriptionColor),
              onBackground: HexColor(descriptionColor),
              onError: Colors.white,
              brightness: Brightness.light),
          textTheme: TextTheme(
              headline1: TextStyle(
                  fontSize: 20,
                  color: HexColor(primaryColor),
                  fontWeight: FontWeight.bold),
              headline2: TextStyle(
                  fontSize: 16,
                  color: HexColor(primaryColor),
                  fontWeight: FontWeight.w600),
              headline3: TextStyle(
                  fontSize: 16,
                  color: HexColor(primaryColor),
                  fontWeight: FontWeight.bold),
              bodyText1: TextStyle(
                  fontSize: 14,
                  color: HexColor(secondaryColor),
                  fontWeight: FontWeight.normal),
              bodyText2:
                  TextStyle(fontSize: 12, color: HexColor(descriptionColor)))),
      // home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
