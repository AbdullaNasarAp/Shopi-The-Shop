class CategoryModel {
  final String imagePath;
  final String name;
  final String id;
  CategoryModel({
    required this.imagePath,
    required this.name,
    required this.id,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      imagePath: json['image'],
      name: json['name'],
      id: json['_id'],
    );
  }
}
