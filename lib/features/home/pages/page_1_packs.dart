import 'package:flutter/material.dart';
import '../../../core/widgets/neon_card_tile.dart';
import '../../draft/screens/draft_screen.dart';
import '../../sbc/screens/sbc_list_screen.dart';
import '../../store/screens/store_screen.dart';
import '../../cards/screens/latest_cards_screen.dart';
import '../../objectives/screens/objectives_screen.dart';
import '../../collection/screens/my_collection_screen.dart';

class Page1Packs extends StatelessWidget {
  const Page1Packs({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Column(
        children: [
          NeonCardTile(
            title: 'Draft',
            height: 140,
            bgGradient: const LinearGradient(
              colors: [Color(0xFF2C003E), Color(0xFF12001F)],
            ),
            borderGradient: const LinearGradient(
              colors: [Colors.purpleAccent, Colors.pinkAccent],
            ),
            topWidget: const Text(
              'Draft',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DraftScreen()),
              );
            },
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: NeonCardTile(
                  title: 'Store',
                  height: 120,
                  borderGradient: const LinearGradient(
                    colors: [Colors.cyanAccent, Colors.blueAccent],
                  ),
                  topWidget: const Icon(Icons.shopping_bag_outlined, size: 40, color: Colors.cyanAccent),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const StoreScreen()),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: NeonCardTile(
                  title: 'Latest Cards',
                  height: 120,
                  borderGradient: const LinearGradient(
                    colors: [Colors.pinkAccent, Colors.purpleAccent],
                  ),
                  topWidget: const Icon(Icons.style_outlined, size: 40, color: Colors.pinkAccent),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LatestCardsScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: NeonCardTile(
                  title: 'Objectives',
                  height: 120,
                  borderGradient: const LinearGradient(
                    colors: [Colors.redAccent, Colors.orangeAccent],
                  ),
                  topWidget: const Icon(Icons.emoji_events_outlined, size: 40, color: Colors.redAccent),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ObjectivesScreen()),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: NeonCardTile(
                  title: 'SBC',
                  height: 120,
                  borderGradient: const LinearGradient(
                    colors: [Colors.amber, Colors.orange],
                  ),
                  topWidget: const Icon(Icons.stars_outlined, size: 40, color: Colors.amberAccent),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SBCListScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          NeonCardTile(
            title: 'My Collection',
            height: 110,
            borderGradient: const LinearGradient(
              colors: [Colors.tealAccent, Colors.cyanAccent],
            ),
            topWidget: const Icon(Icons.collections_bookmark_outlined, size: 40, color: Colors.tealAccent),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyCollectionScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}