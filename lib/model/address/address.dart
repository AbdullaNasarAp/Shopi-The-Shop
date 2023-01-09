class AddAddressModel {
  final String title;
  final String fullName;
  final String phone;
  final String pin;
  final String state;
  final String place;
  final String address;
  final String landMark;

  AddAddressModel({
    required this.title,
    required this.fullName,
    required this.phone,
    required this.pin,
    required this.state,
    required this.place,
    required this.address,
    required this.landMark,
  });
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'fullName': fullName,
      'phone': phone,
      'pin': pin,
      'state': state,
      'place': place,
      'address': address,
      'landMark': landMark,
    };
  }
}
