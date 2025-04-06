import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/Utilities/enums.dart';
import 'package:learning_app/features/Home/viewmodels/category_viewmodel.dart';
import 'package:learning_app/services/category_services.dart';

final categoryControllerProvider = StateNotifierProvider<CategoryController, CategoryViewModel>((ref) {
  return CategoryController();
});

class CategoryController extends StateNotifier<CategoryViewModel> {
  CategoryController() : super(CategoryViewModel());

  Future<void> fetchCategories() async {
    state = CategoryViewModel(state: CategoryState.loading);
    try {
      final categories = await CategoryService.getAllCategories();
      state = CategoryViewModel(
        state: CategoryState.success,
        categories: categories,
      );
    } catch (e) {
      state = CategoryViewModel(
        state: CategoryState.error,
        error: e.toString(),
      );
    }
  }
}