class PlayerCard {
  final String id;
  final String name;
  final int rating;
  final String position;
  final String club;
  final String nation;
  final String cardType;

  final int pace;
  final int shooting;
  final int passing;
  final int dribbling;
  final int defending;
  final int physical;

  PlayerCard({
    required this.id,
    required this.name,
    required this.rating,
    required this.position,
    required this.club,
    required this.nation,
    this.cardType = 'Gold',
    required this.pace,
    required this.shooting,
    required this.passing,
    required this.dribbling,
    required this.defending,
    required this.physical,
  });
}

final List<PlayerCard> allPlayers = [
  PlayerCard(
    id: '1', name: 'Mbappé', rating: 91, position: 'ST',
    club: 'Real Madrid', nation: 'France',
    pace: 97, shooting: 90, passing: 80, dribbling: 92, defending: 36, physical: 78,
  ),
  PlayerCard(
    id: '2', name: 'De Bruyne', rating: 91, position: 'CM',
    club: 'Man City', nation: 'Belgium',
    pace: 72, shooting: 88, passing: 94, dribbling: 87, defending: 65, physical: 78,
  ),
  PlayerCard(
    id: '3', name: 'Van Dijk', rating: 89, position: 'CB',
    club: 'Liverpool', nation: 'Netherlands',
    pace: 78, shooting: 60, passing: 71, dribbling: 72, defending: 89, physical: 86,
  ),
  PlayerCard(
    id: '4', name: 'Salah', rating: 89, position: 'RW',
    club: 'Liverpool', nation: 'Egypt',
    pace: 89, shooting: 87, passing: 81, dribbling: 88, defending: 45, physical: 75,
  ),
  PlayerCard(
    id: '5', name: 'Bellingham', rating: 90, position: 'CAM',
    club: 'Real Madrid', nation: 'England',
    pace: 80, shooting: 85, passing: 83, dribbling: 88, defending: 78, physical: 82,
  ),
];