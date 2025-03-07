class ChatsModel {
  final String name;
  final String profileImage;
  final List<ChatModel> messages;

  ChatsModel(
      {required this.name, required this.profileImage, required this.messages});

  factory ChatsModel.fromJson(Map<String, dynamic> json) {
    return ChatsModel(
      name: json['name'] ?? '',
      profileImage: json['profile_image'] ?? 0,
      messages: (json['messages'] as List<dynamic>?)
              ?.map((message) => ChatModel.fromJson(message))
              .toList() ??
          [],
    );
  }
}

class ChatModel {
  final String message;
  final int sentBy;
  final String timestamp;

  ChatModel(
      {required this.message, required this.sentBy, required this.timestamp});

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      message: json['message'] ?? '',
      sentBy: json['send_by'] ?? 0,
      timestamp: json['timestamp'] ?? '',
    );
  }
}
