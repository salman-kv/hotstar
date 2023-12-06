import 'package:flutter/material.dart';
import 'package:hotstar/home/download.dart';
import 'package:hotstar/home/home_page.dart';
import 'package:hotstar/home/new_hot.dart';
import 'package:hotstar/home/profile.dart';
import 'package:hotstar/home/search_page.dart';

class MainPage extends StatefulWidget {
   const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int current=0;
  List<Widget> pages=[
   const HomeScreen(),
   const SearchPage(),
   const NewHot(),
   const Download(),
   const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    // MaterialApp
    return SafeArea(
      child: Scaffold(
        backgroundColor:   const Color.fromARGB(255, 3, 0, 15),
        body:pages[current],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: current,
          onTap: (value) {
            current=value;
            setState(() {
              
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor:  const Color.fromARGB(255, 10, 0, 20),
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.flash_on_sharp),label: 'New & Hot'),
          BottomNavigationBarItem(icon: Icon(Icons.download),label: 'Downloads'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded),label: 'My Space'),
        ]),
    
      ),
    );
  }
}