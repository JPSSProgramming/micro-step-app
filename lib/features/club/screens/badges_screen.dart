import 'package:flutter/material.dart';

class BadgesScreen extends StatelessWidget {
  const BadgesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final badges = [
      {'title': 'Pack Collector', 'icon': Icons.inventory_2, 'unlocked': true},
      {'title': 'Draft Master', 'icon': Icons.sports_soccer, 'unlocked': false},
      {'title': 'Fatal Champion', 'icon': Icons.emoji_events, 'unlocked': false},
      {'title': 'Trader', 'icon': Icons.swap_horiz, 'unlocked': true},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF090D16),
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text('BADGES & ACHIEVEMENTS', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: badges.length,
        itemBuilder: (context, index) {
          final badge = badges[index];
          final isUnlocked = badge['unlocked'] as bool;

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF131A29),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: isUnlocked ? Colors.greenAccent : Colors.white24),
            ),
            child: Row(
              children: [
                Icon(
                  badge['icon'] as IconData,
                  size: 36,
                  color: isUnlocked ? Colors.greenAccent : Colors.white24,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    badge['title'] as String,
                    style: TextStyle(
                      color: isUnlocked ? Colors.white : Colors.white38,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Icon(
                  isUnlocked ? Icons.check_circle : Icons.lock,
                  color: isUnlocked ? Colors.greenAccent : Colors.white24,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}