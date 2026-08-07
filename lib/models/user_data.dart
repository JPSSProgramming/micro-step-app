import 'player_card.dart';

class UserData {
  static int coins = 20000;
  static int level = 1;
  static int lPoints = 0;
  static int tokens = 12;

  static List<PlayerCard> myCollection = [];

  static void addCard(PlayerCard card) {
    if (!myCollection.any((c) => c.name == card.name)) {
      myCollection.add(card);
    }
  }

  static int get collectionPercent {
    if (allPlayers.isEmpty) return 0;
    return ((myCollection.length / allPlayers.length) * 100).round();
  }
}