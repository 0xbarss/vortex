import '../../../../core/utils/time_utils.dart';
import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String id;

  UserModel({
    required this.id,
    required super.name,
    required super.username,
    required super.email,
    required super.profilePicture,
    required super.isOnline,
    required super.status,
    required super.lastSeen,
    required super.createdAt,
    required super.fcmToken,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      profilePicture: map['profilePictureUrl'] ?? '',
      isOnline: map['isOnline'] ?? false,
      status: map['statusMessage'] ?? '',
      lastSeen: toDate(map['lastSeen'])?.toLocal() ?? DateTime.now(),
      createdAt: toDate(map['createdAt'])?.toLocal() ?? DateTime.now(),
      fcmToken: map['fcmToken'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'profilePicture': profilePicture,
      'isOnline': isOnline,
      'status': status,
      'lastSeen': fromDate(lastSeen),
      'createdAt': fromDate(createdAt),
      'fcmToken': fcmToken,
    };
  }

  static Map<String, dynamic> template({
    String? name,
    String? username,
    String? email,
    String? profilePicture,
    bool? isOnline,
    String? status,
    DateTime? lastSeen,
    DateTime? createdAt,
    String? fcmToken,
  }) {
    return {
      'name': name ?? '',
      'username': username ?? '',
      'email': email ?? '',
      'profilePicture': profilePicture ?? '',
      'isOnline': isOnline ?? false,
      'status': status ?? '',
      'lastSeen': fromDate(lastSeen ?? DateTime.now()),
      'createdAt': fromDate(createdAt ?? DateTime.now()),
      'fcmToken': fcmToken ?? '',
    };
  }
}
