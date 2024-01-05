import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_app/screens/quiz_screen/bullet_point.dart';
import 'package:learning_app/screens/quiz_screen/custom_widget.dart';



class ExamDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
          'Detail Test',
          style: GoogleFonts.gothicA1(
            color: Colors.white,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "SSC/UPSC Exam Details",
              style: GoogleFonts.gothicA1(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.lightGreen,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 23,
              decoration: const BoxDecoration(
                color: Colors.lightGreen,
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 233, 229, 224),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0, bottom: 12.0),
                      child: Container(
                        width: 50,
                        height: 5,
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 18.0, top: 14.0),
                              child: Text(
                                "Brief explanation about this test",
                                style: GoogleFonts.gothicA1(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                            ),
                            const CustomWidget(
                              icon: Icons.assignment,
                              title: '10 Questions',
                              subtitle: '10 points for a correct answers',
                            ),
                            const CustomWidget(
                              icon: Icons.timer,
                              title: '1 hour 15 mins',
                              subtitle: 'Total duration of the test',
                            ),
                            const CustomWidget(
                              icon: Icons.grade,
                              title: 'Win 10 star',
                              subtitle: 'Answer all questions correctly',
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 18.0, top: 14.0, right: 28.0),
                              child: Text(
                                "Please read the text below carefully so you can understand it",
                                style: GoogleFonts.gothicA1(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 16.0, right: 28.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BulletPoint(
                                      text:
                                          '10 point awarded for a correct answer and no marks for a incorrect answer.'),
                                  BulletPoint(
                                      text:
                                          'Tap on options to select the correct answer'),
                                  BulletPoint(
                                      text:
                                          'Tap on the bookmark icon to save interesting questions'),
                                  BulletPoint(
                                      text:
                                          'Click submit if you are sure you want to complete all the quizzes.'),
                                ],
                              ),
                            ),
                            const SizedBox(height: 120),
                            Center(
                              child: Container(
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.lightGreen,
                                ),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Start Test",
                                    style: GoogleFonts.gothicA1(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}