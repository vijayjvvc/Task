import 'package:flutter/material.dart';

class imageHome extends StatelessWidget {
  String imgSrc;
  String text;
  imageHome({Key? key, required this.imgSrc, required this.text})
      : super(key: key);
  static const double gap = 8.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: gap),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: AssetImage("assets/img/" + imgSrc),
                    fit: BoxFit.cover)),
          ),
          Text(
            text,
            style: TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}
