import 'player_card.dart';

class FatalCardStat {
  final String name;
  final int value;

  FatalCardStat({required this.name, required this.value});
}

class FatalMatch {
  final PlayerCard userCard;
  final PlayerCard opponentCard;
  int userScore;
  int opponentScore;

  FatalMatch({
    required this.userCard,
    required this.opponentCard,
    this.userScore = 0,
    this.opponentScore = 0,
  });
}