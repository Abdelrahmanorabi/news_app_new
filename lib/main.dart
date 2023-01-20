import 'package:flutter/material.dart';
import 'package:news_app_new/home/news/news_details_screen.dart';
 import 'home/home_screen.dart';
import 'home/news/search_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        NewsDetailsScreen.routeName: (_) => NewsDetailsScreen(),
        SearchScreen.routeName:(_)=>SearchScreen(),
       },
    );
  }
}
