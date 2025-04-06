class BannerModel {
  final int id;
  final String bannerImage;
  final String title;
  final String? subTitle;
  final String url;

  BannerModel({
    required this.id,
    required this.bannerImage,
    required this.title,
    this.subTitle,
    required this.url,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      bannerImage: json['bannerImage'],
      title: json['title'],
      subTitle: json['subTitle'],
      url: json['url'],
    );
  }
}