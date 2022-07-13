import 'package:flutter/material.dart';

class DisneyPlusBottomNavigationBar extends StatelessWidget {
  static const mickeyMouseFace = 'assets/mickey_mouse_face.png';

  const DisneyPlusBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(color: Colors.white12, height: 0.5, thickness: 0.5),
        BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.download),
              label: 'Downloads',
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 16,
                child: CircleAvatar(
                  backgroundImage: AssetImage(mickeyMouseFace),
                  radius: 15,
                ),
              ),
              label: 'Profile',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.5),
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ],
    );
  }
}
