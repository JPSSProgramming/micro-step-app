import 'package:flutter/material.dart';
import '../../../core/widgets/neon_card_tile.dart';
import '../../my_club/screens/my_cards_screen.dart';

class Page3Club extends StatelessWidget {
  const Page3Club({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Column(
        children: [
          NeonCardTile(
            title: 'My Cards',
            height: 130,
            borderGradient: const LinearGradient(colors: [Colors.blueAccent, Colors.purpleAccent]),
            topWidget: const Icon(Icons.collections_bookmark_outlined, size: 46, color: Colors.blueAccent),
            onTap: () {},
          ),
          const SizedBox(height: 10),

          Row(
            children: [
              Expanded(
                child: NeonCardTile(
                  title: 'Collections',
                  topWidget: const Text(
                    '0%',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.cyanAccent),
                  ),
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: NeonCardTile(
                  title: 'Badges',
                  topWidget: const Icon(Icons.verified_user_outlined, size: 40, color: Colors.greenAccent),
                  onTap: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          Row(
            children: [
              Expanded(
                child: NeonCardTile(
                  title: 'My Stats',
                  topWidget: const Icon(Icons.bar_chart_outlined, size: 40, color: Colors.amberAccent),
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: NeonCardTile(
                  title: 'My Squads',
                  topWidget: const Icon(Icons.groups_outlined, size: 40, color: Colors.pinkAccent),
                  onTap: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          Row(
            children: [
              Expanded(
                child: NeonCardTile(
                  title: 'Settings',
                  height: 90,
                  topWidget: const Icon(Icons.settings_outlined, size: 30, color: Colors.white70),
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child:NeonCardTile(
                  title: 'My Cards',
                  height: 130,
                  borderGradient: const LinearGradient(colors: [Colors.blueAccent, Colors.purpleAccent]),
                  topWidget: const Icon(Icons.collections_bookmark_outlined, size: 46, color: Colors.blueAccent),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyCardsScreen()),
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