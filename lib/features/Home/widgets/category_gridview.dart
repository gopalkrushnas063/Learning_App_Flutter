import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/features/Home/widgets/category_page.dart';
import 'package:learning_app/services/api_services.dart';


class CategoryGrid extends StatelessWidget {
  final List<String> catNames = [
    'All Exams',
    'Daily Practices',
    'Mock Test',
    'Question Papers',
    'Why Choose Us',
    'Leader Board'
  ];

  List<Color> catColors = [
    Color(0xFFFFCF2F),
    Color(0xFF6FE08D),
    Color(0xFF618DFD),
    Color(0xFFFC7F7F),
    Color(0xFFC084FB),
    Color(0xFF78E667),
  ];

  final List<String> apiEndpoints = [
    'all_exams.json',
    'daily_practices.json',
    'mock_test.json',
    'question_papers.json',
    'why_we_choose.json',
    'leader_board.json',
  ];

  final List<IconData> catIcons = [
    Icons.all_inbox,
    Icons.question_answer,
    Icons.assignment,
    Icons.question_answer_outlined,
    Icons.question_mark,
    Icons.emoji_events,
  ];

  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: catNames.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.1,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            _navigateToCategoryPage(context, apiEndpoints[index]);
          },
          child: Column(
            children: [
              ClayContainer(
                height: 60,
                width: 60,
                borderRadius:50,
              color: Color.fromARGB(255, 238, 250, 241),
              curveType: CurveType.concave,
                child: Center(
                  child: Icon(
                    catIcons[index],
                    size: 30,
                    color: catColors[index],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                catNames[index],
                maxLines: 2,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _navigateToCategoryPage(BuildContext context, String endpoint) async {
    try {
      List<dynamic> fetchedData = await apiService.fetchDataFromApi(endpoint);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryPage(categoryData: fetchedData,categoryName: endpoint,),
        ),
      );
    } catch (e) {
      // Handle error fetching data
      print('Error: $e');
    }
  }
}