class AddressGetModel {
  AddressGetModel({
    required this.id,
    required this.user,
    required this.title,
    required this.fullName,
    required this.phone,
    required this.pin,
    required this.state,
    required this.place,
    required this.address,
    required this.landMark,
  });

  String id;
  String user;
  String title;
  String fullName;
  String phone;
  String pin;
  String state;
  String place;
  String address;
  String landMark;

  factory AddressGetModel.fromJson(Map<String, dynamic> json) =>
      AddressGetModel(
        id: json["_id"],
        user: json["user"],
        title: json["title"],
        fullName: json["fullName"],
        phone: json["phone"],
        pin: json["pin"],
        state: json["state"],
        place: json["place"],
        address: json["address"],
        landMark: json["landMark"],
      );
}
