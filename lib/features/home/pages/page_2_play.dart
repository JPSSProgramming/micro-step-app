import 'package:flutter/material.dart';
import '../../../core/widgets/neon_card_tile.dart';
import '../../fatal/screens/fatal_match_screen.dart';
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
          NeonCardTile(
            title: 'Pack',
            height: 140,
            bgGradient: const LinearGradient(
              colors: [Color(0xFF003830), Color(0xFF001510)],
            ),
            borderGradient: const LinearGradient(
              colors: [Colors.tealAccent, Colors.greenAccent],
            ),
            topWidget: const Icon(Icons.inventory_2_outlined, size: 50, color: Colors.tealAccent),
            onTap: () {},
          ),
          const SizedBox(height: 14),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.greenAccent.withOpacity(0.5), width: 1.5),
              gradient: const LinearGradient(
                colors: [Color(0xFF0D2820), Color(0xFF05120E)],
              ),
            ),
            child: Column(
              children: [
                const Text(
                  'FATAL',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    color: Colors.redAccent,
                  ),
                ),
                const SizedBox(height: 10),
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
          const SizedBox(height: 14),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    NeonCardTile(
                      title: 'Draft Duos',
                      height: 100,
                      borderGradient: const LinearGradient(colors: [Colors.purpleAccent, Colors.cyanAccent]),
                      topWidget: const Icon(Icons.people_outline, size: 36, color: Colors.cyanAccent),
                      onTap: () {},
                    ),
                    const SizedBox(height: 10),
                    NeonCardTile(
                      title: 'Trading',
                      height: 90,
                      borderGradient: const LinearGradient(colors: [Colors.teal, Colors.blueAccent]),
                      topWidget: const Icon(Icons.swap_horiz, size: 36, color: Colors.tealAccent),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TransferMarketScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: NeonCardTile(
                  title: 'Draft Modes',
                  height: 200,
                  borderGradient: const LinearGradient(colors: [Colors.amber, Colors.tealAccent]),
                  topWidget: const Icon(Icons.shield_outlined, size: 50, color: Colors.amberAccent),
                  onTap: () {},
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
      child: Column(
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 2),
          Text(subtitle, style: const TextStyle(color: Colors.white38, fontSize: 10)),
        ],
      ),
    );
  }
}