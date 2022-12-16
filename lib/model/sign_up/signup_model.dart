class SignUpModel {
  String? fullname;
  String? email;
  String? number;
  String? password;

  SignUpModel({
    required this.email,
    required this.fullname,
    required this.number,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'email': email,
      'number': number,
      'password': password,
    };
  }

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      email: json['email'],
      fullname: json['fullname'],
      number: json['number'],
      password: json['password'],
    );
  }
}
