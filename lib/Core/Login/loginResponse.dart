class loginUserResponse {
  final String status;
  String userId;
  String authToken;

  loginUserResponse({required this.status, required this.userId, required this.authToken});

  factory loginUserResponse.fromJson(Map<String, dynamic> json) {
    return loginUserResponse(
      status: json['status'],
      userId: json['data']['userId'],
      authToken: json['data']['authToken'],
    );
  }
}