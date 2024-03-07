class RegisterResponse {
  String name;
  String firstname;
  String email;
  int role;
  String password;

  RegisterResponse(
  {required this.name,
  required this.firstname,
  required this.email,
  required this.role,
  required this.password});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      name: json['name'],
      firstname: json['firstname'],
      email: json['email'],
      role: json['role'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['firstname'] = this.firstname;
    data['email'] = this.email;
    data['role'] = this.role;
    data['password'] = this.password;
    return data;
  }
}
