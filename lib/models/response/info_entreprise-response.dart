class EntrepriseInfoResponse {
  String status;
  String message;

  EntrepriseInfoResponse({ required this.status, required this.message});

  factory EntrepriseInfoResponse.fromJson(Map<String, dynamic> json) {
    return EntrepriseInfoResponse(
      status: json['status'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
