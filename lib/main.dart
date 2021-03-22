import 'package:astrology_pic_of_day/Style.dart';
import 'package:astrology_pic_of_day/View/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Astrology Picture Of The Day',
      theme: ThemeData(
        primarySwatch: Style.primaryColor,
      ),
      home: HomePage(),
    );
  }
}


