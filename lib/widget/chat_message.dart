import 'package:flutter/material.dart';

class MessageChat extends StatelessWidget {
  String Message;
  bool isMe;
  MessageChat({Key? key, required this.Message, this.isMe = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: isMe ? Colors.green : Colors.white),
          child: Text(
            Message,
            textAlign: TextAlign.end,
            style: TextStyle(
              color: isMe ? Colors.white : Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
