import '../../../../core/utils/time_utils.dart';
import '../../domain/entities/chat_entity.dart';

class ChatModel extends ChatEntity {
  final String chatID;

  ChatModel({
    required this.chatID,
    required super.creatorID,
    required super.chatName,
    required super.isGroup,
    required super.chatImage,
    required super.admins,
    required super.createdAt,
    required super.lastMessage,
  });

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      chatID: map['chatID'] ?? '',
      creatorID: map['creatorID'] ?? '',
      chatName: map['chatName'] ?? '',
      isGroup: map['isGroup'] ?? false,
      chatImage: map['chatImage'] ?? '',
      admins: List<String>.from(map['admins'] ?? []),
      createdAt: toDate(map['createdAt'])?.toLocal() ?? DateTime.now(),
      lastMessage: map['lastMessage'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chatID': chatID,
      'creatorID': creatorID,
      'chatName': chatName,
      'isGroup': isGroup,
      'chatImage': chatImage,
      'admins': admins,
      'createdAt': fromDate(createdAt),
      'lastMessage': lastMessage,
    };
  }

  static Map<String, dynamic> template({
    String? creatorID,
    String? chatName,
    bool? isGroup,
    String? chatImage,
    List<String>? admins,
    DateTime? createdAt,
    String? lastMessage,
  }) {
    return {
      'creatorID': creatorID ?? '',
      'chatName': chatName ?? '',
      'isGroup': isGroup ?? false,
      'chatImage': chatImage ?? '',
      'admins': admins ?? [],
      'createdAt': fromDate(createdAt ?? DateTime.now()),
      'lastMessage': lastMessage ?? '',
    };
  }
}
