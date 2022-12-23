class CarousalModel {
  final String id;
  final String offer;
  final String carousal;

  CarousalModel({
    required this.id,
    required this.offer,
    required this.carousal,
  });

  factory CarousalModel.fromJson(Map<String, dynamic> json) {
    return CarousalModel(
      id: json["_id"],
      offer: json["offer"],
      carousal: json["image"],
    );
  }
}
