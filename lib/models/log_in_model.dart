class LogInModel {
  final String email;
  final String password;

  LogInModel({
    required this.email,
    required this.password,
  });

  factory LogInModel.fromJson(Map<String, dynamic> json) =>
      LogInModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() =>
      {
        "email": email,
        "password": password,
      };
}
