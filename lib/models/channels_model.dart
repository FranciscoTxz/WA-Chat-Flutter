class ChannelsModel {
  final String name;
  final String groupImage;
  final String lastMessage;
  final String date;

  ChannelsModel(
      {required this.name,
      required this.groupImage,
      required this.lastMessage,
      required this.date});

  factory ChannelsModel.fromJson(Map<String, dynamic> json) {
    return ChannelsModel(
      name: json['name'] ?? '',
      groupImage: json['group_image'] ?? '',
      lastMessage: json['last_message'] ?? '',
      date: json['date'] ?? '',
    );
  }
}
