class VerifyOtpResponse {
  String message;
  String role;
  int id;

  VerifyOtpResponse(
      {required this.message, required this.role, required this.id});

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
    return VerifyOtpResponse(
      message : json['message'],
      role : json['role'],
      id : json['id'],
    );
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['role'] = this.role;
    data['id'] = this.id;
    return data;
  }
}
