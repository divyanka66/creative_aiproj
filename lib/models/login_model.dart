class LoginModel {

  final String accessToken;

  LoginModel({
    required this.accessToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {

    return LoginModel(
      accessToken: json["data"]["accessToken"] ?? "",
    );
  }
}