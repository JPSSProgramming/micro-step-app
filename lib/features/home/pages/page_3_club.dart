import 'package:flutter/material.dart';
import '../../../core/widgets/neon_card_tile.dart';
import '../../../models/user_data.dart';
import '../../../models/player_card.dart';
import '../../collection/screens/my_collection_screen.dart';
import '../../profile/screens/profile_screen.dart';
import '../../store/screens/store_screen.dart';
import '../../club/screens/badges_screen.dart';
import '../../club/screens/my_squads_screen.dart';
import '../../club/screens/settings_screen.dart';

class Page3Club extends StatelessWidget {
  const Page3Club({super.key});

  @override
  Widget build(BuildContext context) {
    // Обчислення відсотка зібраних карток
    final totalPlayers = allPlayers.isNotEmpty ? allPlayers.length : 1;
    final collectedCount = UserData.myCollection.length;
    final collectionPercent = ((collectedCount / totalPlayers) * 100).toInt();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Column(
        children: [
          // 1. My Cards (Top Banner)
          NeonCardTile(
            title: 'My Cards',
            height: 120,
            borderGradient: const LinearGradient(
              colors: [Colors.blueAccent, Colors.purpleAccent],
            ),
            topWidget: const Icon(Icons.collections_bookmark_outlined, size: 42, color: Colors.blueAccent),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyCollectionScreen()),
              );
            },
          ),
          const SizedBox(height: 12),

          // 2. Collections % & Badges
          Row(
            children: [
              Expanded(
                child: NeonCardTile(
                  title: 'Collections',
                  height: 120,
                  borderGradient: const LinearGradient(
                    colors: [Colors.cyanAccent, Colors.tealAccent],
                  ),
                  topWidget: Text(
                    '$collectionPercent%',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Colors.cyanAccent,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyCollectionScreen()),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: NeonCardTile(
                  title: 'Badges',
                  height: 120,
                  borderGradient: const LinearGradient(
                    colors: [Colors.greenAccent, Colors.cyanAccent],
                  ),
                  topWidget: const Icon(Icons.verified_user_outlined, size: 40, color: Colors.greenAccent),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BadgesScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // 3. My Stats & My Squads
          Row(
            children: [
              Expanded(
                child: NeonCardTile(
                  title: 'My Stats',
                  height: 120,
                  borderGradient: const LinearGradient(
                    colors: [Colors.amberAccent, Colors.orangeAccent],
                  ),
                  topWidget: const Icon(Icons.bar_chart_rounded, size: 40, color: Colors.amberAccent),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfileScreen()),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: NeonCardTile(
                  title: 'My Squads',
                  height: 120,
                  borderGradient: const LinearGradient(
                    colors: [Colors.pinkAccent, Colors.purpleAccent],
                  ),
                  topWidget: const Icon(Icons.groups_outlined, size: 40, color: Colors.pinkAccent),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MySquadsScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // 4. Settings & Pack Store (виправлено дублювання)
          Row(
            children: [
              Expanded(
                child: NeonCardTile(
                  title: 'Settings',
                  height: 110,
                  borderGradient: const LinearGradient(
                    colors: [Colors.purpleAccent, Colors.pinkAccent],
                  ),
                  topWidget: const Icon(Icons.settings_outlined, size: 38, color: Colors.purpleAccent),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SettingsScreen()),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: NeonCardTile(
                  title: 'Pack Store',
                  height: 110,
                  borderGradient: const LinearGradient(
                    colors: [Colors.blueAccent, Colors.cyanAccent],
                  ),
                  topWidget: const Icon(Icons.shopping_bag_outlined, size: 38, color: Colors.cyanAccent),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const StoreScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}