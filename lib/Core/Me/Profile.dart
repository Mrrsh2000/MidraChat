class ProfileData {
  String name;
  String username;
  String avatarUrl;

  ProfileData({required this.name, required this.username, required this.avatarUrl});

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      name: json['name'],
      username: json['username'],
      avatarUrl: json['avatarUrl'],
    );
  }
}