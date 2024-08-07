class UserModel {
  final String tittle;
  final String Imgurl;

  UserModel({required this.tittle, required this.Imgurl});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        tittle: json["title"] ?? "kabi",
        Imgurl: json["image_url"] ??
            "https://cdn.subspace.money/whatsub_blogs/slate(1).png");
  }
}
