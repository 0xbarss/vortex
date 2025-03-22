import '../../../../core/constants/message_type.dart';

class MessageEntity {
  String chatID;
  String senderID;
  String content;
  String messageType;
  DateTime createdAt;

  MessageEntity({
    required this.chatID,
    required this.senderID,
    required this.content,
    required this.messageType,
    required this.createdAt,
  }) {
    if (chatID.isEmpty) throw ArgumentError("MessageEntity.chatID cannot be empty");
    if (senderID.isEmpty) throw ArgumentError("MessageEntity.senderID cannot be empty");
    if (content.isEmpty) throw ArgumentError("MessageEntity.content cannot be empty");
    if (!MessageType.values.contains(messageType)) throw ArgumentError("MessageEntity.messageType has an invalid value");
  }
}
