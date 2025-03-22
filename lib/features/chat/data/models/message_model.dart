import '../../../../core/utils/time_utils.dart';
import '../../domain/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  final String id;

  MessageModel({
    required this.id,
    required super.chatID,
    required super.senderID,
    required super.content,
    required super.messageType,
    required super.createdAt,
  });

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'],
      chatID: map['chatID'] ?? '',
      senderID: map['senderID'] ?? '',
      content: map['content'] ?? '',
      messageType: map['messageType'] ?? '',
      createdAt: toDate(map['createdAt'])?.toLocal() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'chatID': chatID,
      'senderID': senderID,
      'content': content,
      'messageType': messageType,
      'createdAt': fromDate(createdAt),
    };
  }

  static Map<String, dynamic> template({
    String? chatID,
    String? senderID,
    String? content,
    String? messageType,
    DateTime? createdAt,
  }) {
    return {
      'chatID': chatID ?? '',
      'senderID': senderID ?? '',
      'content': content ?? '',
      'messageType': messageType ?? '',
      'createdAt': fromDate(createdAt ?? DateTime.now()),
    };
  }
}
