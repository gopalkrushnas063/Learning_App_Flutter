import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/screens/quiz_screen/test_list_screen.dart';

class CategoryPage extends StatelessWidget {
  final List<dynamic> categoryData;
  final String categoryName; // Added categoryName parameter

  CategoryPage({required this.categoryData, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    Color baseColor = Color.fromARGB(255, 238, 250, 241);

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: Text(categoryName),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: categoryData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>TestList() ,));
              },
              child: ClayContainer(
                borderRadius: 12,
                color: baseColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      categoryData[index]['images'],
                      width: 50,
                    ),
                    SizedBox(height: 10,),
                    Text(categoryData[index]['title'],style: TextStyle(fontSize: 12),),
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
