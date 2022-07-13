import 'package:flutter/material.dart';

class MoviesView extends StatelessWidget {
  final String title;
  final List<String> movies;

  const MoviesView({Key? key, required this.title, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 180,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              addAutomaticKeepAlives: true,
              children: movies.map((cover) => buildCover(cover)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Container buildCover(String cover) {
    return Container(
      margin: const EdgeInsets.only(right: 16.0),
      child: Image.network(
        cover,
        fit: BoxFit.contain,
      ),
    );
  }
}
