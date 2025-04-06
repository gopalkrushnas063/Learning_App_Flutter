import 'package:learning_app/data/http/http.dart';
import 'package:learning_app/features/Home/models/banner.dart';

class BannerService {
  static Future<List<BannerModel>> getAllBanners() async {
    try {
      final response = await Http.apiURL.get('/banner/all_banners');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => BannerModel.fromJson(json)).toList();
      }
      throw Exception('Failed to load banners');
    } catch (e) {
      throw Exception('Failed to load banners: ${e.toString()}');
    }
  }
}