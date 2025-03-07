class StatusModel {
  final String photo;
  final String pp;
  final String name;
  final String date;
  final int seen;

  StatusModel(
      {required this.photo,
      required this.pp,
      required this.name,
      required this.date,
      required this.seen});

  factory StatusModel.fromJson(Map<String, dynamic> json) {
    return StatusModel(
      photo: json['photo'] ?? '',
      pp: json['pp'] ?? '',
      name: json['name'] ?? '',
      date: json['date'] ?? '',
      seen: json['seen'] ?? 0,
    );
  }
}
