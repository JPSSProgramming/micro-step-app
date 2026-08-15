import 'player_card.dart';

class Formation {
  final String name;
  final List<String> positions;

  Formation({required this.name, required this.positions});
}

final List<Formation> availableFormations = [
  Formation(name: '4-3-3', positions: ['GK', 'LB', 'CB', 'CB', 'RB', 'CM', 'CM', 'CM', 'LW', 'ST', 'RW']),
  Formation(name: '4-4-2', positions: ['GK', 'LB', 'CB', 'CB', 'RB', 'LM', 'CM', 'CM', 'RM', 'ST', 'ST']),
  Formation(name: '4-2-3-1', positions: ['GK', 'LB', 'CB', 'CB', 'RB', 'CDM', 'CDM', 'CAM', 'CAM', 'CAM', 'ST']),
  Formation(name: '3-5-2', positions: ['GK', 'CB', 'CB', 'CB', 'LM', 'CDM', 'CDM', 'RM', 'CAM', 'ST', 'ST']),
  Formation(name: '5-3-2', positions: ['GK', 'LWB', 'CB', 'CB', 'CB', 'RWB', 'CM', 'CM', 'CM', 'ST', 'ST']),
];

class DraftSquad {
  Formation formation;
  Map<int, PlayerCard?> startingPlayers;
  int rating;
  int chemistry;

  DraftSquad({
    required this.formation,
    Map<int, PlayerCard?>? startingPlayers,
    this.rating = 0,
    this.chemistry = 0,
  }) : startingPlayers = startingPlayers ?? Map.fromIterable(
    List.generate(11, (i) => i),
    key: (item) => item as int,
    value: (_) => null,
  );
}