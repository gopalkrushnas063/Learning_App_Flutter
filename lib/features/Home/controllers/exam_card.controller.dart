import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/Utilities/enums.dart';
import 'package:learning_app/features/Home/viewmodels/exam_card_viewmodel.dart';
import 'package:learning_app/services/exam_card_services.dart';

final examCardControllerProvider = StateNotifierProvider<ExamCardController, ExamCardViewModel>((ref) {
  return ExamCardController();
});

class ExamCardController extends StateNotifier<ExamCardViewModel> {
  ExamCardController() : super(ExamCardViewModel());

  Future<void> fetchExamCards() async {
    state = ExamCardViewModel(state: ExamCardState.loading);
    try {
      final examCards = await ExamCardService.getAllExamCards();
      state = ExamCardViewModel(
        state: ExamCardState.success,
        examCards: examCards,
      );
    } catch (e) {
      state = ExamCardViewModel(
        state: ExamCardState.error,
        error: e.toString(),
      );
    }
  }
}