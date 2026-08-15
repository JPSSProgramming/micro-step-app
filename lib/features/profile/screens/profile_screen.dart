import 'package:flutter/material.dart';
import '../../../models/user_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090D16),
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text('MY PROFILE', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.amber,
                child: Icon(Icons.person, size: 50, color: Colors.black),
              ),
              const SizedBox(height: 12),
              const Text(
                'Player_1',
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              _buildStatTile('Coins', '${UserData.coins} 🪙', Colors.amber),
              const SizedBox(height: 10),
              _buildStatTile('Collection Size', '${UserData.myCollection.length} Cards', Colors.cyanAccent),
              const SizedBox(height: 10),
              _buildStatTile('Drafts Played', '0', Colors.purpleAccent),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatTile(String label, String value, Color accentColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF131A29),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: accentColor.withOpacity(0.4)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 16)),
          Text(value, style: TextStyle(color: accentColor, fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}