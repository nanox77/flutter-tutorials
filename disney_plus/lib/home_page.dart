import 'package:disney_plus/carousel_view.dart';
import 'package:disney_plus/disney_app_bar.dart';
import 'package:disney_plus/disney_plus_bottom_navigation_bar.dart';
import 'package:disney_plus/movies_view.dart';
import 'package:disney_plus/top_studios_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const kBackgroundColor = Color.fromARGB(30, 34, 49, 255);

  static List<String> covers = [
    'https://media.comicbook.com/uploads1/2015/06/antmanposter-139745.jpg',
    'https://i.pinimg.com/236x/92/5d/e8/925de870f00d0f1f83502772bbc6c84c.jpg',
    'https://hips.hearstapps.com/digitalspyuk.cdnds.net/13/18/comics-infinity-1-cover-artwork.jpg',
    'https://i.pinimg.com/originals/69/3b/5a/693b5ae03a25cb9d3a6ce3f567d1f817.jpg',
    'https://i.pinimg.com/736x/fd/12/df/fd12dfea52d3f17c9ef93a148ccf2c4c.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: const DisneyAppBar(),
      body: ListView(
        addAutomaticKeepAlives: true,
        shrinkWrap: true,
        children: [
          const SizedBox(height: 10),
          const CarouselView(),
          const SizedBox(height: 20),
          const TopStudiosView(),
          const SizedBox(height: 20),
          MoviesView(title: 'Recommended for You', movies: covers),
          const SizedBox(height: 20),
          MoviesView(title: 'Hit Movies', movies: covers),
        ],
      ),
      bottomNavigationBar: const DisneyPlusBottomNavigationBar(),
    );
  }
}
