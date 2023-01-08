class AddAddressModel {
  final String addressType;
  final String name;
  final String contactNumber;
  final String pinCode;
  final String state;
  final String place;
  final String address;
  final String landMark;

  AddAddressModel({
    required this.addressType,
    required this.name,
    required this.contactNumber,
    required this.pinCode,
    required this.state,
    required this.place,
    required this.address,
    required this.landMark,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": addressType,
      "fullName": name,
      "phone": contactNumber,
      "pin": pinCode,
      "state": state,
      "place": place,
      "address": address,
      "landMark": landMark,
    };
  }
}
