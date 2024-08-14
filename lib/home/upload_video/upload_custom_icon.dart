import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UploadCustomIcon extends StatelessWidget {
  const UploadCustomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 46,
      height: 32,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 12),
            width: 50,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 250, 47, 108),
                borderRadius: BorderRadius.circular(8)),
          ),
          Container(
            margin: EdgeInsets.only(right: 12),
            width: 40,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 32, 211, 234),
                borderRadius: BorderRadius.circular(8)),
          ),
          Center(
            child: Container(
              height: double.infinity,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Icon(
                Icons.add,
                color: Colors.black,
                size: 24,
              ),
            ),
          )
        ],
      ),
    );
  }
}
