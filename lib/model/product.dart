class Product {
  String? seller;
  String? product;
  String? variety;
  int? price;
  int? avgWeight;
  int? perBox;
  int? boxes;
  String? delivery;

  Product(
      {this.seller,
      this.product,
      this.variety,
      this.price,
      this.avgWeight,
      this.perBox,
      this.boxes,
      this.delivery});

  Product.fromJson(Map<String, dynamic> json) {
    seller = json['Seller'];
    product = json['Product'];
    variety = json['Variety'];
    price = json['Price'];
    avgWeight = json['AvgWeight'];
    perBox = json['PerBox'];
    boxes = json['Boxes'];
    delivery = json['Delivery'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Seller'] = this.seller;
    data['Product'] = this.product;
    data['Variety'] = this.variety;
    data['Price'] = this.price;
    data['AvgWeight'] = this.avgWeight;
    data['PerBox'] = this.perBox;
    data['Boxes'] = this.boxes;
    data['Delivery'] = this.delivery;
    return data;
  }
}
