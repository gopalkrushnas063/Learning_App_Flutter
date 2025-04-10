import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/Utilities/enums.dart';
import 'package:learning_app/features/Home/controllers/category.controller.dart';
import 'package:learning_app/features/Home/controllers/exam_card.controller.dart';
import 'package:learning_app/features/Home/models/category_model.dart';
import 'package:learning_app/features/Home/widgets/category_page.dart';
import 'package:learning_app/theme/light_and_dark_theme.dart';
import 'package:learning_app/theme/provider/theme_provider.dart';
import 'package:shimmer/shimmer.dart'; // Add this import

class CategoryGrid extends ConsumerStatefulWidget {
  const CategoryGrid({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoryGridState();
}

class _CategoryGridState extends ConsumerState<CategoryGrid> {
  @override
  void initState() {
    super.initState();
    // Fetch categories when widget is first built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(categoryControllerProvider.notifier).fetchCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoryState = ref.watch(categoryControllerProvider);
    final isDarkMode = ref.watch(themeProvider) == darkTheme;

    // Show shimmer while fetching data
    if (categoryState.state == CategoryState.loading) {
      return _buildShimmerGrid(ref);
    }

    // Show error message if API fails
    if (categoryState.state == CategoryState.error) {
      return Center(
        child: Text(
          'Failed to load categories: ${categoryState.error}',
          textAlign: TextAlign.center,
        ),
      );
    }

    // Show empty state if no categories found
    if (categoryState.categories.isEmpty) {
      return const Center(
        child: Text(
          'No Categories Found',
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    // Show grid of categories
    return GridView.builder(
      itemCount: categoryState.categories.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.1,
      ),
      itemBuilder: (context, index) {
        final category = categoryState.categories[index];
        return GestureDetector(
          onTap: () => _handleCategoryTap(context, ref, category),
          child: Column(
            children: [
              ClayContainer(
                height: 60,
                width: 60,
                borderRadius: 50,
                color: isDarkMode
                    ? Color(0xFF161616)
                    : const Color.fromARGB(255, 238, 250, 241),
                curveType: CurveType.concave,
                child: Center(
                  child: Icon(
                    category.icon,
                    size: 30,
                    color: category.color,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                category.catNames,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: isDarkMode
                      ? Color(0xFFDCDCDC)
                      : Colors.black.withOpacity(0.7),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildShimmerGrid(WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider) == darkTheme;
    Color baseColor = isDarkMode
        ? Color(0xFF161616)
        : const Color.fromARGB(255, 238, 250, 241);
    return GridView.builder(
      itemCount: 6, // Show 6 shimmer items
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.1,
      ),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: isDarkMode ? Color(0xFF161616) : Colors.grey[300]!,
          highlightColor: isDarkMode ? Color(0xFF212121) : Colors.grey[100]!,
          child: Column(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: isDarkMode ? Color(0xFF212121) : Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 50,
                height: 12,
                color: isDarkMode ? Color(0xFF212121) : Colors.white,
              ),
            ],
          ),
        );
      },
    );
  }

  void showLoadingDialog(BuildContext context) {
    // Create an AnimationController
    final AnimationController controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: Navigator.of(context), // This takes care of the ticker provider
    )..repeat(); // Makes the animation loop indefinitely

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: RotationTransition(
            turns: controller,
            child: const Icon(
              Icons.refresh,
              size: 30,
              color: Colors.green,
            ),
          ),
        ),
      ),
    ).then((_) {
      // Dispose the controller when the dialog is dismissed
      controller.dispose();
    });
  }

  Future<void> _handleCategoryTap(
      BuildContext context, WidgetRef ref, CategoryModel category) async {
    if (category.catNames == 'All Exams') {
      // Show shimmer loading dialog
      showLoadingDialog(context);

      try {
        // Fetch exam cards
        await ref.read(examCardControllerProvider.notifier).fetchExamCards();

        // Close loading dialog
        if (context.mounted) Navigator.of(context).pop();

        // Navigate to CategoryPage
        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryPage(
                categoryName: category.catNames,
              ),
            ),
          );
        }
      } catch (e) {
        // Close loading dialog
        if (context.mounted) Navigator.of(context).pop();

        // Show error message
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Failed to load exam cards: ${e.toString()}')),
          );
        }
      }
    } else {
      // For other categories, use mock data
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(
              categoryName: category.catNames,
              initialData: _getMockDataForCategory(category.catNames),
            ),
          ),
        );
      }
    }
  }

  List<Map<String, dynamic>> _getMockDataForCategory(String categoryName) {
    // Return different mock data based on category
    switch (categoryName) {
      case 'Daily Practices':
        return [
          {'images': '', 'title': 'Daily Quiz 1', 'url': ''},
          {'images': '', 'title': 'Daily Quiz 2', 'url': ''},
        ];
      case 'Mock Test':
        return [
          {'images': '', 'title': 'Full Mock Test', 'url': ''},
          {'images': '', 'title': 'Sectional Test', 'url': ''},
        ];
      case 'Question Papers':
        return [
          {'images': '', 'title': 'Previous Year Papers', 'url': ''},
          {'images': '', 'title': 'Sample Papers', 'url': ''},
        ];
      default:
        return [
          {'images': '', 'title': 'Coming Soon', 'url': ''},
        ];
    }
  }
}
