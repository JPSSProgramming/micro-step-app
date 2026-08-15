import 'package:flutter/material.dart';

class SBCListScreen extends StatelessWidget {
  const SBCListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090D16),
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text('SBC CHALLENGES', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSBCCard(
            context: context,
            title: 'STARTER SBC',
            description: 'Build a squad with 75+ rating and 10+ chemistry',
          ),
          const SizedBox(height: 12),
          _buildSBCCard(
            context: context,
            title: 'EXPERT CHALLENGE',
            description: 'Build a squad with 84+ rating and 20+ chemistry',
          ),
        ],
      ),
    );
  }

  Widget _buildSBCCard({
    required BuildContext context,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF131A29),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.amber, width: 1.5),
      ),
      child: Row(
        children: [
          const Icon(Icons.stars_rounded, size: 48, color: Colors.amber),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$title builder coming soon!'),
                  backgroundColor: Colors.amber,
                ),
              );
            },
            child: const Text(
              'BUILD',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}