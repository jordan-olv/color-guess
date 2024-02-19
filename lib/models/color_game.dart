import 'dart:math';
import 'package:flutter/material.dart';
import 'package:devises/services/service.dart';

class ColorGame {
  Color targetColor;
  List<Color> options;
  int lives;
  int score;

  ColorGame({required this.targetColor, required this.options, this.lives = 5, this.score = 0});

  factory ColorGame.generate(int lives, int score) {
    Random random = Random();
    Color targetColor = Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
    List<Color> options = List.generate(3, (_) => Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1));
    options.insert(random.nextInt(4), targetColor);
    return ColorGame(targetColor: targetColor, options: options, lives: lives, score: score);
  }

  bool checkAnswer(Color color) {
    if (color == targetColor) {
      score++; // Augmente le score
      return true; // Bonne réponse
    } else {
      lives--; // Décrémente les vies
      return false; // Mauvaise réponse
    }
  }

  bool get isGameOver => lives <= 0;

  void endGame() {
  Service.addScore('test', score);
  resetGame();
  }

  void resetGame() {
    ColorGame newGame = ColorGame.generate(5, 0);
    targetColor = newGame.targetColor;
    options = newGame.options;
    lives = newGame.lives;
    score = newGame.score;
  }
}
