import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_list.dart';
import 'home_screen.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    ChatList(),
  ];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Black background for the entire screen
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors
            .grey.shade800, // Black background for the BottomNavigationBar
        onTap: onTabTapped,
        currentIndex: currentIndex,
        // selectedItemColor: Colors.blueAccent, // Blue color for selected items
        unselectedItemColor: Colors.white, // Grey color for unselected items
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house_alt_fill),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_copy),
            label: 'Chats',
          ),
        ],
      ),
    );
  }
}
