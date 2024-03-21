class RegisterResponse {
  final String message;
  final String status;


  RegisterResponse({required this.message , required this.status});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(message: json['message'] , status: json['status']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;

    return data;
  }
}
