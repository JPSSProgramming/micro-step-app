import 'player_card.dart';

class SBCChallenge {
  final String id;
  final String title;
  final String description;
  final int minRating;
  final int minChemistry;
  final int rewardCoins;
  final String rewardPackName;
  bool isCompleted;

  SBCChallenge({
    required this.id,
    required this.title,
    required this.description,
    required this.minRating,
    required this.minChemistry,
    required this.rewardCoins,
    required this.rewardPackName,
    this.isCompleted = false,
  });
}

final List<SBCChallenge> sampleSBCs = [
  SBCChallenge(
    id: 'sbc_1',
    title: 'STARTER SBC',
    description: 'Зберіть склад із рейтингом 75+ та хімією 10+',
    minRating: 75,
    minChemistry: 10,
    rewardCoins: 10000,
    rewardPackName: 'GOLD PACK',
  ),
  SBCChallenge(
    id: 'sbc_2',
    title: 'EXPERT CHALLENGE',
    description: 'Зберіть склад із рейтингом 84+ та хімією 20+',
    minRating: 84,
    minChemistry: 20,
    rewardCoins: 30000,
    rewardPackName: 'SPECIAL PACK 85+',
  ),
];