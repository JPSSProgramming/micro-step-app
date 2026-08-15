import 'package:flutter/material.dart';
import '../../../core/widgets/neon_card_tile.dart';
import '../../draft/screens/draft_screen.dart';
import '../../packs/screens/store_screen.dart';
import '../../sbc/screens/sbc_list_screen.dart';

class Page1Packs extends StatelessWidget {
  const Page1Packs({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DraftScreen()),
              );
            },
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.purpleAccent.withOpacity(0.8), width: 2),
                gradient: const LinearGradient(
                  colors: [Color(0xFF2E004F), Color(0xFF120024)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purpleAccent.withOpacity(0.2),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'Draft',
                  style: TextStyle(
                    fontSize: 46,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),

          Row(
            children: [
              Expanded(
                child: NeonCardTile(
                  title: 'Store',
                  topWidget: const Icon(Icons.shopping_bag_outlined, size: 40, color: Colors.cyanAccent),
                  borderGradient: const LinearGradient(colors: [Colors.cyan, Colors.blue]),
                  onTap: () {
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: NeonCardTile(
                  title: 'Latest Cards',
                  topWidget: const Icon(Icons.style_outlined, size: 40, color: Colors.pinkAccent),
                  borderGradient: const LinearGradient(colors: [Colors.pinkAccent, Colors.purpleAccent]),
                  onTap: () {
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          Row(
            children: [
              Expanded(
                child: NeonCardTile(
                  title: 'Objectives',
                  topWidget: const Icon(Icons.emoji_events_outlined, size: 40, color: Colors.redAccent),
                  borderGradient: const LinearGradient(colors: [Colors.redAccent, Colors.orangeAccent]),
                  onTap: () {
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: NeonCardTile(
                  title: 'SBC',
                  topWidget: const Icon(Icons.workspace_premium_outlined, size: 40, color: Colors.amberAccent),
                  borderGradient: const LinearGradient(colors: [Colors.amber, Colors.deepOrange]),
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
          const SizedBox(height: 10),

          NeonCardTile(
            title: 'Store',
            topWidget: const Icon(Icons.shopping_bag_outlined, size: 40, color: Colors.cyanAccent),
            borderGradient: const LinearGradient(colors: [Colors.cyan, Colors.blue]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StoreScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}