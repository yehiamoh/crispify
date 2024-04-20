class EmailModel {
  final String email;

  EmailModel({
    required this.email,
  });

  factory EmailModel.fromJson(Map<String, dynamic> json) => EmailModel(
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
  };
}