import 'package:devises/services/service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:devises/views/game_widget.dart';
import 'package:devises/views/leaderboard_widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget();

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  // Contrôleur pour le champ de texte
  final TextEditingController _pseudoController = TextEditingController();

  // Méthode pour vérifier si le champ est vide
  bool _isButtonDisabled() {
    return _pseudoController.text.isEmpty;
  }

  @override
  void initState() {
    super.initState();
    // Ajoute un listener pour détecter les changements dans le champ de texte
    _pseudoController.addListener(() {
      setState(() {}); // Force le rebuild pour mettre à jour l'état du bouton
    });
  }

  @override
  void dispose() {
    _pseudoController
        .dispose(); // Nettoie le contrôleur quand le widget est supprimé
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ma page d\'accueil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _pseudoController,
                decoration: InputDecoration(
                  labelText: 'Pseudo',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _isButtonDisabled()
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                GameWidget(pseudo: _pseudoController.text)),
                      );
                    },
              child: Text('Play'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LeaderboardWidget()));
                // Insérer la logique pour afficher le leaderboard ici
              },
              child: Text('Leaderboard'),
            ),
          ],
        ),
      ),
    );
  }
}
