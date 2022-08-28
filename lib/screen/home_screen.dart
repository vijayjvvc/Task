import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/model/product.dart';
import 'package:task/utlis/colors.dart';
import 'package:task/widget/bottom_sheet.dart';
import 'package:task/widget/home_image.dart';
import 'package:task/widget/item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _editingController = TextEditingController();
  List<Product> list = [];
  List<Product> mainList = [];
  bool haveValue = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var productJson = await rootBundle.loadString("assets/json/Fruits.json");
    var decoderData = jsonDecode(productJson);
    list = List.from(decoderData)
        .map<Product>((product) => Product.fromJson(product))
        .toList();

    setState(() {});
  }

  void filter(String value) async {
    mainList.clear();
    if (value.isNotEmpty) {
      list.forEach((produc) {
        if (produc.seller
            .toString()
            .toLowerCase()
            .contains(value.toLowerCase().toLowerCase())) {
          setState(() {
            mainList.add(produc);
            haveValue = true;
          });
        } else {
          setState(() {
            haveValue = true;
          });
        }
      });
    } else {
      setState(() {
        haveValue = false;
      });
    }
  }

  void removeKey(BuildContext context) {
    FocusScopeNode current = FocusScope.of(context);
    if (!current.hasPrimaryFocus) {
      current.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              removeKey(context);
            },
            child: Column(
              children: [
                SizedBox(
                  height: 230,
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                        child: Text(
                          "Buy",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: widthOfScreen * (2.3 / 3),
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5),
                                child: TextField(
                                    maxLines: 1,
                                    controller: _editingController,
                                    onChanged: ((value) {
                                      filter(value);
                                    }),
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.search,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                    ),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(Icons.search),
                                      hintText: 'Search',
                                    )),
                              ),
                            ),
                            Container(
                              width: widthOfScreen * (0.5 / 3),
                              height: 45,
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SizedBox(
                                        height: 200,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 18.0),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                BottomSortSheet(text: "Name"),
                                                Divider(
                                                  height: 10,
                                                  color: Colors.black,
                                                ),
                                                BottomSortSheet(text: "Price"),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Icon(
                                      Icons.sort,
                                      size: 24,
                                    ),
                                    Text(
                                      "Sort",
                                      style: TextStyle(fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          imageHome(imgSrc: "image 1.png", text: "Apple"),
                          imageHome(imgSrc: "image 2.png", text: "Mangoes"),
                          imageHome(imgSrc: "image 3.png", text: "Grapes"),
                          imageHome(imgSrc: "image 4.png", text: "Watermelon"),
                          imageHome(imgSrc: "image 5.png", text: "Lemons"),
                        ]),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: mainList.length == 0
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount:
                                haveValue ? mainList.length : list.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return ProductWidget(
                                  product: haveValue
                                      ? mainList[index]
                                      : list[index]);
                            })
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: mainList.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return ProductWidget(product: mainList[index]);
                            })),
              ],
            ),
          ),
        ));
  }
}
