class ExamCardModel {
  final int id;
  final String icon;
  final String title;
  final String url;

  ExamCardModel({
    required this.id,
    required this.icon,
    required this.title,
    required this.url,
  });

  factory ExamCardModel.fromJson(Map<String, dynamic> json) {
    return ExamCardModel(
      id: json['id'],
      icon: json['icon'],
      title: json['title'],
      url: json['url'],
    );
  }
}