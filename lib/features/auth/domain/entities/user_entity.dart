import 'package:vortex/core/constants/user_status_constants.dart';

class UserEntity {
  final String uid;
  final String name;
  final String email;
  final String status;
  final String profileImage;
  final DateTime lastSeen;
  final String fcmToken;

  UserEntity({
    required this.uid,
    required this.name,
    required this.email,
    required this.status,
    required this.profileImage,
    required this.lastSeen,
    required this.fcmToken,
  }) {
    if (uid.isEmpty) throw ArgumentError("UID cannot be empty");
    if (name.isEmpty) throw ArgumentError("Name cannot be empty");
    if (email.isEmpty || !email.contains('@')) throw ArgumentError("Invalid email format");
    if (!UserStatus.validStatuses.contains(status)) throw ArgumentError("Invalid status: $status");
  }

  UserEntity copyWith({
    String? name,
    String? email,
    String? status,
    String? profileImage,
    DateTime? lastSeen,
    String? fcmToken,
  }) {
    return UserEntity(
      uid: uid,
      name: name ?? this.name,
      email: email ?? this.email,
      status: status ?? this.status,
      profileImage: profileImage ?? this.profileImage,
      lastSeen: lastSeen ?? this.lastSeen,
      fcmToken: fcmToken ?? this.fcmToken,
    );
  }
}
