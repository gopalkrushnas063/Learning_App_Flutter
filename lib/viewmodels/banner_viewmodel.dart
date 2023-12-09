import 'package:learning_app/model/banner.dart';
import 'package:learning_app/services/api_services.dart';

class BannerViewModel {
  final ApiService _apiService = ApiService();

  Future<List<BannerModel>> getAllBanners() async {
    try {
      final List<dynamic> response = await _apiService.fetchAllBanners();
      print(response);
      return response.map((banner) => BannerModel.fromJson(banner)).toList();
    } catch (e) {
      rethrow;
    }
  }
}