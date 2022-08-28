import 'package:flutter/material.dart';

class BottomSortSheet extends StatelessWidget {
  String text;
  BottomSortSheet({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        Icon(Icons.arrow_upward),
        Icon(Icons.arrow_downward),
      ]),
    );
  }
}
