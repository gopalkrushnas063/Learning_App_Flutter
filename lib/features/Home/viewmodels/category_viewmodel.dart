import 'package:learning_app/Utilities/enums.dart';
import 'package:learning_app/features/Home/models/category_model.dart';

class CategoryViewModel {
  final List<CategoryModel> categories;
  final CategoryState state;
  final String? error;

  CategoryViewModel({
    this.categories = const [],
    this.state = CategoryState.initial,
    this.error,
  });
}

