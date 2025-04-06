import 'package:learning_app/data/http/http.dart';
import 'package:learning_app/features/Home/models/category_model.dart';

class CategoryService {
  static Future<List<CategoryModel>> getAllCategories() async {
    try {
      final response = await Http.apiURL.get('/category/all_categoriesList');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => CategoryModel.fromJson(json)).toList();
      }
      throw Exception('Failed to load categories');
    } catch (e) {
      throw Exception('Failed to load categories: ${e.toString()}');
    }
  }
}