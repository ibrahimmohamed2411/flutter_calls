class UserModel {
  final String email;
  final String password;
  final String fcmToken;
  UserModel({
    required this.email,
    required this.password,
    required this.fcmToken,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'fcmToken': fcmToken,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      password: map['password'] as String,
      fcmToken: map['fcmToken'] as String,
    );
  }

}
