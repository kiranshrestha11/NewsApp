import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/views/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return const MaterialApp(
      title: 'Alzazira News',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
