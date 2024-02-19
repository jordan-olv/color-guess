import 'package:flutter/material.dart';
import 'package:devises/models/color_game.dart';

class GameWidget extends StatefulWidget {

  final String pseudo;
    GameWidget({required this.pseudo});
  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  late ColorGame game;

  @override
  void initState() {
    super.initState();
    game = ColorGame.generate(5, 0);
  }

void _checkColor(Color color) {
  bool isCorrect = game.checkAnswer(color);
  setState(() {
    if (isCorrect) {
      // Si la réponse est correcte, générer un nouveau jeu sans réinitialiser les vies et le score
      game = ColorGame.generate(game.lives, game.score);
    } else {
      if (game.isGameOver) {
        // Fin du jeu
        //final snackBar = SnackBar(content: Text('Game Over! Your score: ${game.score}. Restarting...'));
        //ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //game.resetGame(); // Réinitialiser le jeu
        game.endGame();
      }
    }
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lives: ${game.lives} | Score: ${game.score}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('RGB(${game.targetColor.red}, ${game.targetColor.green}, ${game.targetColor.blue})', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: game.options.map((color) {
              return GestureDetector(
                onTap: () => _checkColor(color),
                child: Container(
                  width: 100,
                  height: 100,
                  color: color,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
