import 'package:flutter/material.dart';
import 'package:task/model/product.dart';
import 'package:task/widget/chat_message.dart';
import 'package:task/widget/item_widget.dart';

import '../utlis/colors.dart';

class ChatPage extends StatefulWidget {
  Product product;
  ChatPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatMessage> listOfChat = [];

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    listOfChat.add(ChatMessage(messageContent: "", messageType: ""));
    listOfChat.add(ChatMessage(
        messageContent:
            "Hello Buyer we have ${widget.product.product} ready to ship",
        messageType: "f"));
    listOfChat
        .add(ChatMessage(messageContent: "Do let me know", messageType: "f"));
    listOfChat.add(ChatMessage(
        messageContent: "How fast can you deliver?", messageType: "t"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundCardColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          widget.product.seller.toString(),
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: listOfChat.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            itemBuilder: (context, index) {
              if (index == 0) {
                return ProductWidget(product: widget.product, isChat: true);
              } else {
                return MessageChat(
                    Message: listOfChat[index].messageContent,
                    isMe: listOfChat[index].messageType == "t" ? true : false);
              }
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 15, top: 10),
              height: 70,
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: TextField(
                        controller: _controller,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                            hintText: "Message",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      if (_controller.text.length >= 1) {
                        listOfChat.add(ChatMessage(
                            messageContent: _controller.text,
                            messageType: "t"));
                        setState(() {
                          _controller.clear();
                        });
                      }
                    },
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Colors.green,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}
