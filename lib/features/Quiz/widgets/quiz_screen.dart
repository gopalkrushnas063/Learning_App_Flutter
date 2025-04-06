import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizScreen extends StatefulWidget {
  final int totalQuestions;
  final int timePerQuestion;

  const QuizScreen({
    super.key,
    required this.totalQuestions,
    required this.timePerQuestion,
  });

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  int timeLeft = 0;
  late List<bool> selectedAnswers;
  late List<int?> userAnswers;
  late List<Map<String, dynamic>> questions;
  bool _isDialogShowing = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    timeLeft = widget.timePerQuestion;
    _initializeQuestions();
    selectedAnswers = List.filled(4, false);
    userAnswers = List.filled(widget.totalQuestions, null);
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _initializeQuestions() {
    // Replace this with your actual questions data
    questions = [
      {
        'question': 'What is the capital of France?',
        'options': ['London', 'Paris', 'Berlin', 'Madrid'],
        'correctAnswer': 1,
      },
      {
        'question': 'Which planet is known as the Red Planet?',
        'options': ['Venus', 'Mars', 'Jupiter', 'Saturn'],
        'correctAnswer': 1,
      },
      {
        'question': 'What is the largest mammal?',
        'options': ['Elephant', 'Blue Whale', 'Giraffe', 'Hippopotamus'],
        'correctAnswer': 1,
      },
      {
        'question': 'Who painted the Mona Lisa?',
        'options': ['Van Gogh', 'Picasso', 'Da Vinci', 'Michelangelo'],
        'correctAnswer': 2,
      },
      {
        'question': 'What is the chemical symbol for Gold?',
        'options': ['Go', 'Gd', 'Au', 'Ag'],
        'correctAnswer': 2,
      },
    ];
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          timer.cancel();
          _goToNextQuestion();
        }
      });
    });
  }

  void _resetTimer() {
    setState(() {
      timeLeft = widget.timePerQuestion;
    });
    _startTimer();
  }

  void _selectAnswer(int index) {
    setState(() {
      selectedAnswers = List.filled(4, false);
      selectedAnswers[index] = true;
      userAnswers[currentQuestionIndex] = index;
    });
  }

  void _goToNextQuestion() {
    if (_isDialogShowing) return;

    // Calculate score for current question before moving
    _calculateScoreForCurrentQuestion();

    if (currentQuestionIndex < widget.totalQuestions - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswers = List.filled(4, false);
        _resetTimer();
      });
    } else {
      _submitQuiz();
    }
  }

  void _goToPreviousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
        selectedAnswers = List.filled(4, false);
        if (userAnswers[currentQuestionIndex] != null) {
          selectedAnswers[userAnswers[currentQuestionIndex]!] = true;
        }
        _resetTimer();
      });
    }
  }

  void _calculateScoreForCurrentQuestion() {
    if (userAnswers[currentQuestionIndex] != null &&
        userAnswers[currentQuestionIndex] ==
            questions[currentQuestionIndex]['correctAnswer']) {
      score++;
    }
  }

  void _submitQuiz() {
    if (_isDialogShowing) return;

    // Make sure to calculate score for the last question
    _calculateScoreForCurrentQuestion();

    // Ensure score doesn't exceed total questions
    score = score.clamp(0, widget.totalQuestions);

    setState(() {
      _isDialogShowing = true;
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            score >= (widget.totalQuestions / 2)
                ? 'Congratulations!'
                : 'Better Luck Next Time!',
            style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.bold,
              color: score >= (widget.totalQuestions / 2)
                  ? Colors.green
                  : Colors.red,
            ),
          ),
          content: Text(
            'You scored $score out of ${widget.totalQuestions}',
            style: GoogleFonts.ubuntu(fontSize: 18),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                Navigator.pop(context); // Go back to exam details
              },
              child: Text(
                'OK',
                style: GoogleFonts.ubuntu(),
              ),
            ),
          ],
        );
      },
    ).then((_) {
      if (mounted) {
        setState(() {
          _isDialogShowing = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
          'Quiz Test',
          style: GoogleFonts.ubuntu(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                '$timeLeft',
                style: GoogleFonts.ubuntu(
                  color: Colors.lightGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / widget.totalQuestions,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen),
            ),
            const SizedBox(height: 20),
            Text(
              'Question ${currentQuestionIndex + 1}/${widget.totalQuestions}',
              style: GoogleFonts.ubuntu(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              questions[currentQuestionIndex]['question'],
              style: GoogleFonts.ubuntu(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: questions[currentQuestionIndex]['options'].length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _selectAnswer(index),
                    child: Card(
                      color: selectedAnswers[index]
                          ? Colors.lightGreen.withOpacity(0.3)
                          : Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          questions[currentQuestionIndex]['options'][index],
                          style: GoogleFonts.ubuntu(fontSize: 18),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentQuestionIndex > 0)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                    ),
                    onPressed: _goToPreviousQuestion,
                    child: Text(
                      'Previous',
                      style: GoogleFonts.ubuntu(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  )
                else
                  const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                  ),
                  onPressed: _goToNextQuestion,
                  child: Text(
                    currentQuestionIndex == widget.totalQuestions - 1
                        ? 'Submit'
                        : 'Next',
                    style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
