class PlayerScore {
  final String pseudo;
  final int score;

  PlayerScore({required this.pseudo, required this.score});

  factory PlayerScore.fromJson(Map<String, dynamic> json) {
    return PlayerScore(
      pseudo: json['pseudo'],
      score: json['point'],
    );
  }
}