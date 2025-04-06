import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_app/features/Quiz/widgets/bullet_point.dart';
import 'package:learning_app/features/Quiz/widgets/custom_widget.dart';
import 'package:learning_app/features/Quiz/widgets/quiz_screen.dart';

class ExamDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        centerTitle: false,
        title: Text(
          'Detail Test',
          style: GoogleFonts.ubuntu(
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
              style: GoogleFonts.ubuntu(
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
                  color: Color(0xFFf5fbf5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0, bottom: 12.0),
                      child: Container(
                        width: 50,
                        height: 5,
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, top: 14.0),
                                child: Text(
                                  "Brief explanation about this test",
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey[800],
                                  ),
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
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey[800]),
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.only(left: 16.0, right: 28.0),
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
                            ],
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
      bottomNavigationBar: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 50.0,
            vertical: MediaQuery.of(context).size.height / 30,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.lightGreen,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuizScreen(
                      totalQuestions: 5,
                      timePerQuestion: 30,
                    ),
                  ),
                );
              },
              child: Text(
                "Start Test",
                style: GoogleFonts.ubuntu(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
