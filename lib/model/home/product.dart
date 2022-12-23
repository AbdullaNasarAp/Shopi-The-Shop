class ProductModel {
  String id;
  String name;
  int price;
  dynamic discountPrice;
  int offer;
  String rating;
  List<String> size;
  List<String> image;
  String category;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.discountPrice,
    required this.offer,
    required this.rating,
    required this.size,
    required this.image,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      name: json['name'],
      price: json['price'],
      discountPrice: json['discountPrice'],
      offer: json['offer'],
      rating: json['rating'],
      size: List<String>.from(
        json['size'].map((x) => x),
      ),
      image: List<String>.from(
        json['image'].map((x) => x),
      ),
      category: json['category'],
    );
  }
}
