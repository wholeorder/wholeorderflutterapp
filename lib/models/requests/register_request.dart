class RegisterRequest {
  String name;
  String firstname;
  String email;
  int role;
  String password;

  RegisterRequest(
  {required this.name,
  required this.firstname,
  required this.email,
  required this.role,
  required this.password});

  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
      name: json['name'],
      firstname: json['first_name'],
      email: json['email'],
      role: json['role'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['first_name'] = this.firstname;
    data['email'] = this.email;
    data['role'] = this.role;
    data['password'] = this.password;
    return data;
  }
}
