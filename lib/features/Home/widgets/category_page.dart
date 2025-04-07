import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_app/Utilities/enums.dart';
import 'package:learning_app/features/Home/controllers/exam_card.controller.dart';
import 'package:learning_app/features/Quiz/widgets/test_list_screen.dart';
import 'package:learning_app/theme/light_and_dark_theme.dart';
import 'package:learning_app/theme/provider/theme_provider.dart';

class CategoryPage extends ConsumerWidget {
  final String categoryName;
  final List<Map<String, dynamic>>? initialData;

  const CategoryPage({
    super.key,
    required this.categoryName,
    this.initialData,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseColor = const Color.fromARGB(255, 238, 250, 241);
    final isDarkMode = ref.watch(themeProvider) == darkTheme;

    // If we have initial data, use it directly
    if (initialData != null) {
      return _buildScaffold(context, baseColor, initialData!,
          isDarkMode: isDarkMode);
    }

    // Otherwise watch for exam cards state
    final examCardState = ref.watch(examCardControllerProvider);

    return _buildScaffold(
      context,
      baseColor,
      examCardState.examCards
          .map((card) => {
                'images': card.icon,
                'title': card.title,
                'url': card.url,
              })
          .toList(),
      isLoading: examCardState.state == ExamCardState.loading,
      error: examCardState.state == ExamCardState.error
          ? examCardState.error
          : null,
      isDarkMode: isDarkMode,
    );
  }

  Widget _buildScaffold(
    BuildContext context,
    Color baseColor,
    List<Map<String, dynamic>> data, {
    bool isLoading = false,
    String? error,
    bool isDarkMode = false,
  }) {
    return Scaffold(
      backgroundColor: isDarkMode ? Color(0xFF161616) : baseColor,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Color(0xFF161616) : baseColor,
        shadowColor: isDarkMode ? Color(0xFF161616) : baseColor,
        foregroundColor: isDarkMode ? Color(0xFF161616) : baseColor,
        surfaceTintColor: isDarkMode ? Color(0xFF161616) : baseColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDarkMode ? Color(0xFFDCDCDC) : Colors.black,
          ),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(
          categoryName,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Color(0xFFDCDCDC) : Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : error != null
              ? Center(child: Text(error))
              : data.isEmpty
                  ? const Center(child: Text('No data available'))
                  : _buildContent(baseColor, data, isDarkMode),
    );
  }

  Widget _buildContent(
      Color baseColor, List<Map<String, dynamic>> data, bool isDarkMode) {
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? Color(0xFF161616) : baseColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      margin: const EdgeInsets.all(8),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TestList(),
                  ),
                );
              },
              child: ClayContainer(
                borderRadius: 12,
                color: isDarkMode ? Color(0xFF161616) : baseColor,
                height: 80,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: item['images']?.isNotEmpty == true
                          ? Image.network(
                              item['images'],
                              width: 50,
                              height: 50,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.error, size: 50);
                              },
                            )
                          : const Icon(Icons.category, size: 50),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        item['title'],
                        style: const TextStyle(fontSize: 18),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 18.0),
                      child: Icon(
                        Icons.fast_forward,
                        color: Colors.lightGreen,
                        size: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
