import 'package:flutter/material.dart';
import 'package:jor/entity/question.dart';
import 'package:jor/quiz/final_quiz.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _correctAnswersCount = 0;
  bool _isAnswered = false;
  bool _isCorrect = false;

  void _answerQuestion(bool isCorrect) {
    setState(() {
      _isAnswered = true;
      _isCorrect = isCorrect;
      if (isCorrect) _correctAnswersCount++;
    });
  }

  void _showFinalScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FinalScreen(
          correctAnswers: _correctAnswersCount,
          totalQuestions: quizQuestions.length,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_currentQuestionIndex >= quizQuestions.length) {
      Future.delayed(Duration.zero, _showFinalScreen);
      return const SizedBox.shrink();
    }

    final question = quizQuestions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const Text(
          'Quiz do Melhor Amigo',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20), // Ajuste o valor conforme necessário
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: _isAnswered
              ? _buildFeedbackPage(question)
              : _buildQuestionPage(question),
        ),
      ),
    );
  }

  Widget _buildQuestionPage(Question question) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: SingleChildScrollView(
        key: ValueKey<int>(_currentQuestionIndex),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Pergunta ${_currentQuestionIndex + 1} de ${quizQuestions.length}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              question.question,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: question.options
                  .map<Widget>(
                    (option) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () =>
                            _answerQuestion(question.answer.contains(option)),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue.shade300,
                                Colors.purple.shade200,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 6,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Text(
                            option,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedbackPage(Question question) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: Column(
        key: ValueKey<bool>(_isCorrect),
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            _isCorrect ? Icons.check_circle : Icons.cancel,
            color: _isCorrect ? Colors.green : Colors.red,
            size: 120,
          ),
          const SizedBox(height: 20),
          Text(
            _isCorrect ? 'Acertou!' : 'Errou!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: _isCorrect ? Colors.green : Colors.red,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 300,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                    text: "A mensagem certa era...\n\n ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: question.answer.join(" e "),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors
                          .black, // ou qualquer outra cor que você preferir
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (_currentQuestionIndex < quizQuestions.length - 1) {
                  _currentQuestionIndex++;
                  _isAnswered = false;
                } else {
                  _showFinalScreen();
                }
              });
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
              backgroundColor: Colors.deepPurple,
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 5, // Adds a shadow for a modern feel
            ),
            child: const Text('Próxima Pergunta',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
