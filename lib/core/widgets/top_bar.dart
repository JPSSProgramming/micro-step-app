import 'package:flutter/material.dart';

class TopBarWidget extends StatelessWidget {
  final int level;
  final int lPoints;
  final int coins;
  final int tokens;
  final int collectionPercent;

  const TopBarWidget({
    super.key,
    this.level = 1,
    this.lPoints = 0,
    this.coins = 20000,
    this.tokens = 12,
    this.collectionPercent = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      color: Colors.black.withOpacity(0.6),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            Row(
              children: [
                Container(
                  width: 32,
                  height: 22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.white24),
                    image: const DecorationImage(
                      image: NetworkImage('https://flagcdn.com/w40/ua.png'), // Прапор України
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('LVL', style: TextStyle(fontSize: 9, color: Colors.cyanAccent, fontWeight: FontWeight.bold)),
                    Text('$level', style: const TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            const Spacer(),

            // L-points
            _buildCurrencyItem(
              icon: Icons.disc_full,
              iconColor: Colors.orangeAccent,
              value: '$lPoints',
            ),
            const SizedBox(width: 8),

            // MF Coins
            _buildCurrencyItem(
              icon: Icons.monetization_on,
              iconColor: Colors.amber,
              value: _formatCoins(coins),
            ),
            const SizedBox(width: 8),

            // Tokens
            _buildCurrencyItem(
              icon: Icons.view_in_ar,
              iconColor: Colors.blueAccent,
              value: '$tokens',
            ),
            const SizedBox(width: 8),

            Text(
              '$collectionPercent%',
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrencyItem({required IconData icon, required Color iconColor, required String value}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor, size: 16),
          const SizedBox(width: 4),
          Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  String _formatCoins(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(0)}k';
    }
    return number.toString();
  }
}