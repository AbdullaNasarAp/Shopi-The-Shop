class SignUpTokenModel {
  final String accessToken;
  final String refreshToken;
  SignUpTokenModel({
    required this.accessToken,
    required this.refreshToken,
  });
  factory SignUpTokenModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return SignUpTokenModel(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
