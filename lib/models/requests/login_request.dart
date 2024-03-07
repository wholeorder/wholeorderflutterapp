class LoginResponse {
  final String email;
  final String password;

  LoginResponse({required this.email, required this.password});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      email : json['email'],
      password : json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
