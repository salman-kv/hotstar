import 'package:flutter/material.dart';
import 'package:hotstar/screens/download.dart';
import 'package:hotstar/screens/home_page.dart';
import 'package:hotstar/screens/hot.dart';
import 'package:hotstar/screens/profile.dart';
import 'package:hotstar/screens/search_page.dart';

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  MainPage({super.key, data});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int current = 0;
  List<Widget> pages = [
    const HomeScreen(),
     SearchPage(),
     Hot(),
    const Download(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    // MaterialApp
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background ,
        body: pages[current],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: current,
            onTap: (value) {
              current = value;
              setState(() {});
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color.fromARGB(255, 10, 0, 20),
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.white,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.flash_on_sharp), label: 'New & Hot'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.download), label: 'Downloads'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_rounded), label: 'My Space'),
            ]),
        // floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}
