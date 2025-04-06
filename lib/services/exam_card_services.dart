import 'package:learning_app/data/http/http.dart';
import 'package:learning_app/features/Home/models/exam_card_model.dart';

class ExamCardService {
  static Future<List<ExamCardModel>> getAllExamCards() async {
    try {
      final response = await Http.apiURL.get('/examcard/all_exam_card');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => ExamCardModel.fromJson(json)).toList();
      }
      throw Exception('Failed to load exam cards');
    } catch (e) {
      throw Exception('Failed to load exam cards: ${e.toString()}');
    }
  }
}