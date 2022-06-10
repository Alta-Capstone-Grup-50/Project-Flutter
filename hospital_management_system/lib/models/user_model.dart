class UserModel {
  int? id;
  String? name;
  String? email;
  String? profilePic;
  String? accessToken;
  String? tokenType;
  String? message;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.profilePic,
    this.accessToken,
    this.tokenType,
    this.message,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      return UserModel(
        id: json['data']['id'] ?? 0,
        name: json['data']['name'],
        email: json['data']['email'],
        tokenType: json['token_type'],
        accessToken: json['access_token'],
        message: json['message'],
      );
    } else {
      return UserModel(message: json['message']);
    }
  }
}
