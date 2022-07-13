import 'package:disney_plus/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DisneyPlusApp());
}

class DisneyPlusApp extends StatelessWidget {
  const DisneyPlusApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Disney Plus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
