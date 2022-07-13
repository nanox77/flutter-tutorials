import 'package:flutter/material.dart';

class DisneyAppBar extends StatelessWidget implements PreferredSizeWidget {
  static const disneyLogo = 'assets/disney_plus_logo.png';

  const DisneyAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: SizedBox(
        height: kToolbarHeight,
        child: Image.asset(
          disneyLogo,
          fit: BoxFit.contain,
        ),
      ),
      toolbarHeight: kToolbarHeight,
    );
  }
}
