class SignUpModel {
  final String name;
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  SignUpModel({
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    name: json["name"],
    username: json["username"],
    email: json["email"],
    password: json["password"],
    confirmPassword: json["confirmPassword"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "username": username,
    "email": email,
    "password": password,
    "confirmPassword": confirmPassword,
  };
}