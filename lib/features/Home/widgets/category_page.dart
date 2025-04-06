import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/Utilities/enums.dart';
import 'package:learning_app/features/Home/controllers/exam_card.controller.dart';
import 'package:learning_app/features/Quiz/widgets/test_list_screen.dart';

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

    // If we have initial data, use it directly
    if (initialData != null) {
      return _buildScaffold(baseColor, initialData!);
    }

    // Otherwise watch for exam cards state
    final examCardState = ref.watch(examCardControllerProvider);

    return _buildScaffold(
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
    );
  }

  Widget _buildScaffold(
    Color baseColor,
    List<Map<String, dynamic>> data, {
    bool isLoading = false,
    String? error,
  }) {
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: Text(categoryName),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : error != null
              ? Center(child: Text(error))
              : data.isEmpty
                  ? const Center(child: Text('No data available'))
                  : _buildContent(baseColor, data),
    );
  }

  Widget _buildContent(Color baseColor, List<Map<String, dynamic>> data) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
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
                color: baseColor,
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