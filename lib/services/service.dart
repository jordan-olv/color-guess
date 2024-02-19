import 'dart:convert';
import 'package:devises/models/player_score.dart';
import 'package:http/http.dart' as http;

class Service {
  static const endpoint = 'http://10.0.2.2:8000/api';

  static Future<void> addScore(String pseudo, int score) async {
    try {
      final response = await http.post(
        Uri.parse('$endpoint/scores'),
        headers: <String, String>{
          'Content-Type': 'application/ld+json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'pseudo': pseudo,
          'point': score,
        }),
      );

      if (response.statusCode == 200) {
        print("Score ajouté avec succès");
      } else {
        print("Erreur lors de l'ajout du score : ${response.body}");
      }
    } catch (e) {
      print(Uri.parse('$endpoint/scores'));
      print("Exception lors de l'ajout du score : $e");
    }
  }

  static Future<List<PlayerScore>> getLeaderboard() async {
    try {
      final response = await http.get(
        Uri.parse('$endpoint/scores'),
        headers: <String, String>{
          'Content-Type': 'application/ld+json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedBody = jsonDecode(response.body);

        final List<dynamic> scoresList = decodedBody['hydra:member'];

        List<PlayerScore> leaderboard = scoresList
            .map((dynamic item) =>
                PlayerScore.fromJson(item as Map<String, dynamic>))
            .toList();

        return leaderboard;
      } else {
        // Gérer les autres codes de statut HTTP comme une erreur
        throw Exception('Failed to load leaderboard');
      }
    } catch (e) {
      print("Exception lors du chargement du leaderboard : $e");
      throw Exception('Failed to load leaderboard');
    }
  }
}

class Score {
  final String pseudo;
  final int point;

  Score(this.pseudo, this.point);
}
