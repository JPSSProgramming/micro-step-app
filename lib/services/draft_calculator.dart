import '../models/squad.dart';

class DraftCalculator {
  static int calculateRating(DraftSquad squad) {
    final players = squad.startingPlayers.values.whereType<Object>().toList();
    if (players.isEmpty) return 0;

    int totalRating = 0;
    int count = 0;

    squad.startingPlayers.forEach((index, player) {
      if (player != null) {
        totalRating += player.rating;
        count++;
      }
    });

    if (count == 0) return 0;
    return (totalRating / count).round();
  }

  static int calculateChemistry(DraftSquad squad) {
    int totalChem = 0;

    squad.startingPlayers.forEach((index, player) {
      if (player != null) {
        int playerChem = 0;
        final targetPosition = squad.formation.positions[index];

        if (player.position == targetPosition) {
          playerChem += 1;
        }

        squad.startingPlayers.forEach((otherIndex, otherPlayer) {
          if (otherIndex != index && otherPlayer != null) {
            if (otherPlayer.nation == player.nation) {
              playerChem += 1;
            }
            if (otherPlayer.club == player.club) {
              playerChem += 1;
            }
          }
        });

        if (playerChem > 3) playerChem = 3;
        totalChem += playerChem;
      }
    });

    if (totalChem > 33) return 33;
    return totalChem;
  }
}