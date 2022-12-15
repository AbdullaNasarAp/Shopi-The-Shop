class SignInModel {
  final String refreshToken;
  final String accessToken;

  SignInModel({
    required this.refreshToken,
    required this.accessToken,
  });
  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      refreshToken: json['refreshToken'],
      accessToken: json['accessToken'],
    );
  }
}
