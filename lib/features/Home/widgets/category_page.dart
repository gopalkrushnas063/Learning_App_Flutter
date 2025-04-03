import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/features/Quiz/test_list_screen.dart';

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
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: ListView.builder(
          itemCount: categoryData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TestList(),
                  ));
                },
                child: ClayContainer(
                    borderRadius: 12,
                    color: baseColor,
                    height: 80,
                    child: Row(
                      children: [
                        Image.network(
                          categoryData[index]['images'],
                          width: 50,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          categoryData[index]['title'],
                          style: TextStyle(fontSize: 18),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right:18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.fast_forward,
                                  color: Colors.lightGreen,
                                  size: 30.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}
