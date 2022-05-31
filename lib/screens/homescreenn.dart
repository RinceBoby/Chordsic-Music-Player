import 'package:chordsic/interfaces/1%20home.dart';
import 'package:chordsic/interfaces/3%20favorite.dart';
import 'package:chordsic/interfaces/playlist/4%20playlist.dart';
import 'package:chordsic/interfaces/5%20settings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({Key? key}) : super(key: key);

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  int _currentSelectedItemIndex = 0;

  final _pages = [
    const Home(),
    //const Player(),
    const Favorite(),
    const Playlist(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomSheet: MiniPlayer(),
      body: _pages[_currentSelectedItemIndex],
      backgroundColor: const Color.fromARGB(255, 221, 255, 252),
      bottomNavigationBar: Row(
        children: [
          BuildNavBarItem(FontAwesomeIcons.houseUser, 0),
          //BuildNavBarItem(CupertinoIcons.headphones, 1),
          BuildNavBarItem(FontAwesomeIcons.heart, 1),
          BuildNavBarItem(FontAwesomeIcons.listCheck, 2),
          BuildNavBarItem(FontAwesomeIcons.gear, 3),
        ],
      ),
    );
  }

  Widget BuildNavBarItem(
    
    IconData icon,
    int index,
  ) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            _currentSelectedItemIndex = index;
          },
        );
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 4,
        decoration: index == _currentSelectedItemIndex
            ? BoxDecoration(
              //borderRadius: BorderRadius.all(Radius.circular(10)),
                border: const Border(
                  bottom: BorderSide(
                    width: 4,
                    color: Colors.purpleAccent,
                  ),
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.purpleAccent.withOpacity(0.3),
                    Colors.purpleAccent.withOpacity(0.015),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              )
            : const BoxDecoration(),
        child: Icon(
          icon,
          color: index == _currentSelectedItemIndex
              ? Colors.black
              : Colors.grey[800],
        ),
      ),
    );
  }
}
