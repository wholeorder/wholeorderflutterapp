class VerifyOtpResponse {
  String message;
  String status;
  String role;
  int id;

  VerifyOtpResponse(
      {required this.status ,required this.message, required this.role, required this.id});

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
    return VerifyOtpResponse(
      status: json['status'],
      message: json['message'],
      role: json['role'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['role'] = this.role;
    data['id'] = this.id;
    return data;
  }
}
