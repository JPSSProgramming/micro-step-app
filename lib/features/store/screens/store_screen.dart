import 'package:flutter/material.dart';
import '../../../models/user_data.dart';
import '../../../models/player_card.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  void _buyPack(int price, String packName) {
    if (UserData.coins >= price) {
      setState(() {
        UserData.coins -= price;
        final randomPlayer = (List<PlayerCard>.from(allPlayers)..shuffle()).first;
        UserData.myCollection.add(randomPlayer);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Opened $packName! You got ${randomPlayer.name} (${randomPlayer.rating})'),
            backgroundColor: Colors.green,
          ),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Not enough coins!'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090D16),
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text('STORE', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Text(
                '🪙 ${UserData.coins}',
                style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildPackTile('GOLD PACK', 5000, Colors.amberAccent),
          const SizedBox(height: 12),
          _buildPackTile('PRO PACK', 15000, Colors.cyanAccent),
          const SizedBox(height: 12),
          _buildPackTile('ULTIMATE PACK', 50000, Colors.pinkAccent),
        ],
      ),
    );
  }

  Widget _buildPackTile(String title, int price, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF131A29),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color, width: 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 4),
              const Text('Contains 1 Rare Player Card', style: TextStyle(color: Colors.white54, fontSize: 12)),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: color),
            onPressed: () => _buyPack(price, title),
            child: Text('$price 🪙', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}