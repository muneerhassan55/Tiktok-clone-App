import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final IconData? iconData;
  final String? assetRefrence;
  final String labelString;
  final bool isObsecure;
  const TextInputWidget(
      {required this.textEditingController,
      this.iconData,
      this.assetRefrence,
      required this.labelString,
      required this.isObsecure});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          labelText: labelString,
          prefixIcon: iconData != null
              ? Icon(iconData)
              : Padding(
                  padding: EdgeInsets.all(8),
                  child: Image.asset(assetRefrence!),
                ),
          labelStyle: TextStyle(fontSize: 18),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey)),
        ),
        obscureText: isObsecure,
      ),
    );
  }
}
