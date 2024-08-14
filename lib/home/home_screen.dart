// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tictoc_clone_app/home/following/following_video_screen.dart';
import 'package:tictoc_clone_app/home/for_you/for_you_video_screen.dart';
import 'package:tictoc_clone_app/home/profile/profile_screen.dart';
import 'package:tictoc_clone_app/home/search/search_screen.dart';
import 'package:tictoc_clone_app/home/upload_video/upload_custom_icon.dart';
import 'package:tictoc_clone_app/home/upload_video/upload_video_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screenIndex = 0;
  List screenList = [
    ForYouVideoScreen(),
    SearchScreen(),
    UploadVideoScreen(),
    FollowingVideoScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DashBoard'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              label: 'Discover'),
          BottomNavigationBarItem(icon: UploadCustomIcon(), label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.inbox_sharp,
                size: 30,
              ),
              label: 'Following'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: 'Me'),
        ],
        onTap: (index) {
          setState(() {
            screenIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white12,
        currentIndex: screenIndex,
      ),
      body: screenList[screenIndex],
    );
  }
}
