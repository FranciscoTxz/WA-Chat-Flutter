class CallModel {
  final String name;
  final int type;
  final String image;
  final String date;

  CallModel(
      {required this.name,
      required this.type,
      required this.image,
      required this.date});

  factory CallModel.fromJson(Map<String, dynamic> json) {
    return CallModel(
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      image: json['image'] ?? '',
      date: json['date'] ?? '',
    );
  }
}
