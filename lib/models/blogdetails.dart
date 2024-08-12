class UserModel {
  final String tittle;

  UserModel({required this.tittle});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      tittle: json["name"] ?? "kabi",
    );
  }
}
