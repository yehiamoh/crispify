class ResetPasswordModel {
  final String password;
  final String token;

  ResetPasswordModel({
    required this.password,
    required this.token,
  });

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) => ResetPasswordModel(
    password: json["password"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "password": password,
    "token": token,
  };
}
