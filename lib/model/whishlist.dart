import 'package:shopi/model/home/product.dart';

class WishListModel {
  WishListModel({
    required this.id,
    required this.userId,
    required this.products,
  });

  String id;
  String userId;
  List<ProductElement> products;

  factory WishListModel.fromJson(Map<String, dynamic> json) => WishListModel(
        id: json["_id"],
        userId: json["userId"],
        products: List<ProductElement>.from(
            json["products"].map((x) => ProductElement.fromJson(x))),
      );
}

class ProductElement {
  ProductElement({
    required this.product,
    required this.id,
  });

  ProductModel product;
  String id;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        product: ProductModel.fromJson(json["product"]),
        id: json["_id"],
      );
}
