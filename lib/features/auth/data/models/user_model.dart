import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vortex/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.uid,
    required super.name,
    required super.email,
    required super.status,
    required super.profileImage,
    required super.lastSeen,
    required super.fcmToken,
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      uid: doc.id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      status: data['status'] ?? '',
      profileImage: data['profileImage'] ?? '',
      lastSeen: (data['lastSeen'] as Timestamp).toDate(),
      fcmToken: data['fcmToken'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'email': email,
      'status': status,
      'profileImage': profileImage,
      'lastSeen': Timestamp.fromDate(lastSeen),
      'fcmToken': fcmToken
    };
  }
}
