import 'package:flutter/material.dart';
import '../../../core/widgets/neon_card_tile.dart';
import '../../store/screens/store_screen.dart';
import '../../fatal/screens/fatal_match_screen.dart';
import '../../draft/screens/draft_screen.dart';
import '../../market/screens/transfer_market_screen.dart';

class Page2Play extends StatelessWidget {
  const Page2Play({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Column(
        children: [
          // 1. Pack Tile
          NeonCardTile(
            title: 'Pack',
            height: 120,
            borderGradient: const LinearGradient(
              colors: [Colors.tealAccent, Colors.cyanAccent],
            ),
            topWidget: const Icon(Icons.inventory_2_outlined, size: 42, color: Colors.tealAccent),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StoreScreen()),
              );
            },
          ),
          const SizedBox(height: 12),

          // 2. FATAL Tile with 3 Sub-items
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFF131A29),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.redAccent.withOpacity(0.8), width: 1.5),
            ),
            child: Column(
              children: [
                const Text(
                  'FATAL',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    color: Colors.redAccent,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildFatalSubItem(context, 'MY CLUB', 'SERIES 0/7'),
                    _buildFatalSubItem(context, 'SIM', 'SERIES 0/7'),
                    _buildFatalSubItem(context, 'DRAFT', 'DIV 3'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // 3. Grid for Draft Duos, Trading, and Draft Modes
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Column: Draft Duos & Trading
              Expanded(
                child: Column(
                  children: [
                    NeonCardTile(
                      title: 'Draft Duos',
                      height: 110,
                      borderGradient: const LinearGradient(
                        colors: [Colors.purpleAccent, Colors.cyanAccent],
                      ),
                      topWidget: const Icon(Icons.people_alt_outlined, size: 36, color: Colors.cyanAccent),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const DraftScreen()),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    NeonCardTile(
                      title: 'Trading',
                      height: 110,
                      borderGradient: const LinearGradient(
                        colors: [Colors.cyanAccent, Colors.blueAccent],
                      ),
                      topWidget: const Icon(Icons.swap_horiz_rounded, size: 36, color: Colors.cyanAccent),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TransferMarketScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),

              // Right Column: Tall Draft Modes Tile
              Expanded(
                child: NeonCardTile(
                  title: 'Draft Modes',
                  height: 232,
                  borderGradient: const LinearGradient(
                    colors: [Colors.amberAccent, Colors.orangeAccent],
                  ),
                  topWidget: const Icon(Icons.shield_outlined, size: 64, color: Colors.amberAccent),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DraftScreen()),
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

  Widget _buildFatalSubItem(BuildContext context, String title, String subtitle) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FatalMatchScreen()),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.white38, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}