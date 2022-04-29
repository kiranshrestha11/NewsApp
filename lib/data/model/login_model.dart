class LoginModel {
  final String email;
  final String password;

  const LoginModel({
    required this.password,
    required this.email,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(password: json['password'], email: json['email']);
  }

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
