class UserDataModel {
  final String id;
  final String name;
  final String username;
  final String email;
  final String password;
  final List<dynamic> cart;
  final bool isBlock;
  final int v;
  final String resetOtpSecret;
  final dynamic resetPasswordToken;
  final DateTime resetPasswordAt;

  UserDataModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.cart,
    required this.isBlock,
    required this.v,
    required this.resetOtpSecret,
    required this.resetPasswordToken,
    required this.resetPasswordAt,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    id: json["_id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    password: json["password"],
    cart: List<dynamic>.from(json["cart"].map((x) => x)),
    isBlock: json["isBlock"],
    v: json["__v"],
    resetOtpSecret: json["resetOtpSecret"],
    resetPasswordToken: json["resetPasswordToken"],
    resetPasswordAt: DateTime.parse(json["resetPasswordAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "username": username,
    "email": email,
    "password": password,
    "cart": List<dynamic>.from(cart.map((x) => x)),
    "isBlock": isBlock,
    "__v": v,
    "resetOtpSecret": resetOtpSecret,
    "resetPasswordToken": resetPasswordToken,
    "resetPasswordAt": resetPasswordAt.toIso8601String(),
  };
}
