class ChatEntity {
  String creatorID;
  String chatName;
  bool isGroup;
  String chatImage;
  List<String> admins;
  DateTime createdAt;
  late Map<String, dynamic> lastMessage;

  ChatEntity({
    required this.creatorID,
    required this.chatName,
    required this.isGroup,
    required this.chatImage,
    required this.admins,
    required this.createdAt,
    required this.lastMessage,
  }) {
    if (chatName.isEmpty && isGroup) throw ArgumentError("ChatEntity.chatName cannot be empty (Group Chats)");
    if (chatName.isNotEmpty && !isGroup) throw ArgumentError("ChatEntity.chatName must be empty (Private Chats)");
    if (admins.isEmpty && isGroup) throw ArgumentError("ChatEntity.admins cannot be empty (Group Chats)");
    if (admins.isNotEmpty && !isGroup) throw ArgumentError("ChatEntity.admins cannot be empty (Private Chats)");
  }
}
