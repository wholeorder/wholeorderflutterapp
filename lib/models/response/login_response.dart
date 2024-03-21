class LoginResponse {
  String status;
  String message;
  int id;
  String name;
  String firstName;
  String email;
  String role;

  LoginResponse(
       {
        required this.status ,
        required this.message,
      required this.id,
      required this.name,
      required this.firstName,
      required this.email,
      required this.role});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
    status: json['status'],
     message : json['message'],
    id : json['id'],
    name : json['name'],
    firstName : json['first_name'],
    email : json['email'],
    role : json['role'],
    );
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['id'] = this.id;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['email'] = this.email;
    data['role'] = this.role;
    return data;
  }
}
