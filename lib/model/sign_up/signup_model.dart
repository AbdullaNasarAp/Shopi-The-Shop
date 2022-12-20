class SignUpModel {
  final String? username;
  final String? email;
  final String? phone;
  final String? password;

  SignUpModel({
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      username: json["fullname"],
      email: json["email"],
      phone: json["phone"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "fullname": username,
      "email": email,
      "phone": phone,
      "password": password,
    };
  }
}
