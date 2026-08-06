import 'package:flutter/material.dart';
import '../../../models/player_card.dart';
import '../../fatal/screens/match_screen.dart';

class DraftScreen extends StatefulWidget {
  const DraftScreen({super.key});

  @override
  State<DraftScreen> createState() => _DraftScreenState();
}

class _DraftScreenState extends State<DraftScreen> {
  final List<String> positions = [
    'LW', 'ST', 'RW',
    'CM', 'CAM', 'CM',
    'LB', 'CB', 'CB', 'RB',
    'GK'
  ];

  final Map<int, PlayerCard> squad = {};

  int get teamRating {
    if (squad.isEmpty) return 0;
    int sum = squad.values.fold(0, (prev, p) => prev + p.rating);
    return (sum / squad.length).round();
  }

  int get teamChemistry {
    if (squad.isEmpty) return 0;
    int chem = 0;
    squad.forEach((index, player) {
      if (player.position == positions[index]) {
        chem += 20;
      } else {
        chem += 10;
      }
    });
    return chem.clamp(0, 100);
  }

  void _openPlayerPicker(int index) {
    final available = List<PlayerCard>.from(allPlayers)..shuffle();
    final choices = available.take(3).toList();

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E1E2C),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 250,
          child: Column(
            children: [
              Text(
                'Select ${positions[index]}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: choices.map((player) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        squad[index] = player;
                      });
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD4AF37),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.amberAccent, width: 2),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${player.rating}',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            player.position,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            player.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('DRAFT MODE (4-3-3)', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black54,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            color: const Color(0xFF1E1E2C),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 28),
                    const SizedBox(width: 8),
                    Text(
                      'RATING: $teamRating',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.bolt, color: Colors.greenAccent, size: 28),
                    const SizedBox(width: 8),
                    Text(
                      'CHEM: $teamChemistry',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: positions.length,
              itemBuilder: (context, index) {
                final pos = positions[index];
                final player = squad[index];

                return GestureDetector(
                  onTap: () => _openPlayerPicker(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: player != null ? const Color(0xFFD4AF37) : const Color(0xFF2C2C3E),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: player != null ? Colors.amberAccent : Colors.white12,
                        width: 2,
                      ),
                    ),
                    child: player != null
                        ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${player.rating}',
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Text(
                          player.name,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            pos,
                            style: const TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                        : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.add_circle_outline, color: Colors.amber, size: 30),
                        const SizedBox(height: 6),
                        Text(
                          pos,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          if (squad.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MatchScreen(
                        teamRating: teamRating,
                        teamChemistry: teamChemistry,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.play_arrow, color: Colors.black),
                label: const Text(
                  'PLAY MATCH',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
        ],
      ),
    );
  }
}