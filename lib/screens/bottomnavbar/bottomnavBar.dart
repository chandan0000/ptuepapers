import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../controller/utilscontroller.dart';
import '../pages/books.dart';
import '../pages/post.dart';
import '../pages/study.dart';
import '../pages/videos.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  final screens = [
    const study(),
    const books(),
    const videos(),
    const PostScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<UtilsController>(
      builder: (context, value, _) {
        return Scaffold(
          drawer: const Drawer(),
          body: screens[value.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 0.0,
            unselectedFontSize: 0.0,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (index) => value.changeIndex(index),
            iconSize: 20,
            items: const [
              BottomNavigationBarItem(
                icon: FaIcon(CupertinoIcons.house, color: Colors.black),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(CupertinoIcons.search, color: Colors.black),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.book, color: Colors.black),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.podcasts, color: Colors.black),
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }
}
