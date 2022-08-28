import 'package:flutter/material.dart';
import 'package:task/screen/chat_ui.dart';
import 'package:task/utlis/colors.dart';
import 'package:task/widget/top_bottom_widget.dart';
import '../model/product.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  bool isChat;

  ProductWidget({Key? key, required this.product, this.isChat = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isChat) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => ChatPage(product: product))));
        }
      },
      child: Card(
        elevation: 10,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Text(
              product.seller.toString(),
              style: const TextStyle(
                fontSize: 18.00,
              ),
            ),
          ),
          Container(
            color: AppColors.backgroundCardColor,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TopBottom(top: product.product.toString(), bottom: "Product"),
                  TopBottom(top: product.variety.toString(), bottom: "Variety"),
                  TopBottom(
                      top: "₹ " + product.price.toString() + " k", bottom: "r"),
                ]),
          ),
          Container(
            color: AppColors.backgroundCardColor,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TopBottom(
                      top: product.avgWeight.toString() + "gms",
                      bottom: "avg weight"),
                  TopBottom(
                      top: product.perBox.toString() + "kg", bottom: "per Box"),
                  TopBottom(top: product.boxes.toString(), bottom: "Boxes"),
                  TopBottom(
                      top: product.delivery.toString(), bottom: "Delivery"),
                ]),
          )
        ]),
      ),
    );
  }
}
