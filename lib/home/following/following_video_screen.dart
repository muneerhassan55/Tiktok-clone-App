import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FollowingVideoScreen extends StatefulWidget {
  const FollowingVideoScreen({super.key});

  @override
  State<FollowingVideoScreen> createState() => _FollowingVideoScreenState();
}

class _FollowingVideoScreenState extends State<FollowingVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Following Video Screen')),
    );
  }
}
