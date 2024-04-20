class OtpModel {
  final String userotp;
  final String email;

  OtpModel({
    required this.userotp,
    required this.email,
  });

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
    userotp: json["userotp"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "userotp": userotp,
    "email": email,
  };
}