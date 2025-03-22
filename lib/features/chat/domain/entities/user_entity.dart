class UserEntity {
  String name;
  String username;
  String email;
  String profilePicture;
  bool isOnline;
  String status;
  DateTime lastSeen;
  DateTime createdAt;
  String fcmToken;

  UserEntity({
    required this.name,
    required this.username,
    required this.email,
    required this.profilePicture,
    required this.isOnline,
    required this.status,
    required this.lastSeen,
    required this.createdAt,
    required this.fcmToken,
  }) {
    if (name.isEmpty) throw ArgumentError("UserEntity.name cannot be empty");
    if (username.isEmpty) throw ArgumentError("UserEntity.username cannot be empty");
    if (email.isEmpty) throw ArgumentError("UserEntity.email cannot be empty");
  }
}
