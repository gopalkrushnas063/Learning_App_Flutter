import 'package:learning_app/Utilities/enums.dart';
import 'package:learning_app/features/Home/models/exam_card_model.dart';

class ExamCardViewModel {
  final List<ExamCardModel> examCards;
  final ExamCardState state;
  final String? error;

  ExamCardViewModel({
    this.examCards = const [],
    this.state = ExamCardState.initial,
    this.error,
  });
}

