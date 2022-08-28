import 'package:flutter/material.dart';
import 'package:task/utlis/colors.dart';

class TopBottom extends StatelessWidget {
  String top, bottom;
  TopBottom({Key? key, required this.top, required this.bottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: bottom == "r"
          ? Container(
              width: 70,
              height: 20,
              decoration: BoxDecoration(
                  color: AppColors.backgroundCardRupeeColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  top,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          : Column(children: [
              Text(
                top,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                bottom,
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 16,
                ),
              ),
            ]),
    );
  }
}
