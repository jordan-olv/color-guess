import 'package:flutter/material.dart';
import 'package:devises/models/player_score.dart';
import 'package:devises/services/service.dart';
// Assurez-vous d'importer vos autres fichiers Dart nécessaires, comme le modèle et le service

class LeaderboardWidget extends StatefulWidget {
  @override
  _LeaderboardWidgetState createState() => _LeaderboardWidgetState();
}

class _LeaderboardWidgetState extends State<LeaderboardWidget> {
  late Future<List<PlayerScore>> leaderboardFuture;

  @override
  void initState() {
    super.initState();
    leaderboardFuture = Service.getLeaderboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Leaderboard"),
      ),
      body: FutureBuilder<List<PlayerScore>>(
        future: leaderboardFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Erreur lors du chargement du leaderboard"));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                PlayerScore playerScore = snapshot.data![index];
                return ListTile(
                  title: Text(playerScore.pseudo),
                  trailing: Text(playerScore.score.toString()),
                );
              },
            );
          } else {
            return Center(child: Text("Aucun score disponible"));
          }
        },
      ),
    );
  }
}
