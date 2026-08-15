import 'package:flutter/material.dart';
import '../../../models/squad.dart';
import '../../../models/player_card.dart';

class DraftPitchGrid extends StatelessWidget {
  final DraftSquad squad;
  final Function(int positionIndex) onSlotTap;

  const DraftPitchGrid({
    super.key,
    required this.squad,
    required this.onSlotTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF0F2E22), Color(0xFF071711)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        border: Border.all(color: Colors.greenAccent.withOpacity(0.4), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.greenAccent.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: GridView.builder(
        padding: const EdgeInsets.all(12),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.85,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 11,
        itemBuilder: (context, index) {
          final player = squad.startingPlayers[index];
          final posName = squad.formation.positions[index];

          return GestureDetector(
            onTap: () => onSlotTap(index),
            child: Container(
              decoration: BoxDecoration(
                color: player == null ? Colors.white10 : const Color(0xFFD4AF37),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: player == null ? Colors.cyanAccent.withOpacity(0.5) : Colors.amberAccent,
                  width: 1.5,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (player == null) ...[
                    const Icon(Icons.add_circle_outline, color: Colors.cyanAccent, size: 28),
                    const SizedBox(height: 6),
                    Text(
                      posName,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ] else ...[
                    Text(
                      '${player.rating}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      player.position,
                      style: const TextStyle(color: Colors.black87, fontSize: 11, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        player.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}