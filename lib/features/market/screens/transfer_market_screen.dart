import 'package:flutter/material.dart';
import '../../../models/market_listing.dart';
import '../../../models/player_card.dart';
import '../../../models/user_data.dart';

class TransferMarketScreen extends StatefulWidget {
  const TransferMarketScreen({super.key});

  @override
  State<TransferMarketScreen> createState() => _TransferMarketScreenState();
}

class _TransferMarketScreenState extends State<TransferMarketScreen> {
  final List<MarketListing> _listings = [
    if (allPlayers.isNotEmpty) ...[
      MarketListing(id: '1', card: allPlayers[0], price: 12000, sellerName: 'ProTrader99'),
      if (allPlayers.length > 1)
        MarketListing(id: '2', card: allPlayers[1], price: 25000, sellerName: 'FutMaster'),
      if (allPlayers.length > 2)
        MarketListing(id: '3', card: allPlayers[2], price: 45000, sellerName: 'CardCollector'),
    ]
  ];

  void _buyCard(MarketListing listing) {
    if (UserData.coins >= listing.price) {
      setState(() {
        UserData.coins -= listing.price;
        UserData.myCollection.add(listing.card);
        _listings.removeWhere((item) => item.id == listing.id);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Successfully purchased ${listing.card.name}!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Not enough coins to buy this card!'),
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
        title: const Text('TRANSFER MARKET', style: TextStyle(fontWeight: FontWeight.bold)),
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
      body: _listings.isEmpty
          ? const Center(
        child: Text(
          'No listings available at the moment.',
          style: TextStyle(color: Colors.white54, fontSize: 16),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _listings.length,
        itemBuilder: (context, index) {
          final listing = _listings[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF131A29),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.cyanAccent.withOpacity(0.5)),
            ),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 75,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD4AF37),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${listing.card.rating}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                      ),
                      Text(
                        listing.card.position,
                        style: const TextStyle(fontSize: 10, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        listing.card.name,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Seller: ${listing.sellerName}',
                        style: const TextStyle(color: Colors.white54, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),
                  onPressed: () => _buyCard(listing),
                  child: Text(
                    '${listing.price} 🪙',
                    style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}