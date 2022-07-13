import 'package:flutter/material.dart';

class CarouselView extends StatefulWidget {
  const CarouselView({Key? key}) : super(key: key);

  @override
  State<CarouselView> createState() => _CarouselViewState();
}

class _CarouselViewState extends State<CarouselView> {
  List<String> images = [
    "https://d23.com/app/uploads/2019/10/00-toy-story-4-az.jpg",
    "https://d23.com/app/uploads/2019/09/1-endgame-az.jpg",
    "https://d23.com/app/uploads/2017/05/1180w-600h_051917_event-cars-3-screening.jpg",
    "https://d23.com/app/uploads/2020/04/1180w-600h_011520-disney-az-frozen2.jpg",
  ];

  int activePage = 1;
  final _pageController = PageController(viewportFraction: 0.9, initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 220,
      child: PageView.builder(
        controller: _pageController,
        itemCount: images.length,
        pageSnapping: true,
        onPageChanged: (page) => setState(() => activePage = page),
        itemBuilder: (context, pagePosition) {
          bool isCenterImage = pagePosition == activePage;
          return showImage(images[pagePosition], isCenterImage);
        },
      ),
    );
  }

  AnimatedContainer showImage(String image, bool active) {
    double margin = active ? 0 : 20;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: margin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
