import 'package:flutter/material.dart';
import '../../../models/market_listing.dart';
import '../../../models/user_data.dart';

class TransferMarketScreen extends StatefulWidget {
  const TransferMarketScreen({super.key});

  @override
  State<TransferMarketScreen> createState() => _TransferMarketScreenState();
}

class _TransferMarketScreenState extends State<TransferMarketScreen> {
  void _buyCard(MarketListing listing) {
    if (UserData.coins >= listing.price) {
      setState(() {
        UserData.coins -= listing.price;
        UserData.myCollection.add(listing.card);
        sampleMarketListings.removeWhere((item) => item.id == listing.id);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${listing.card.name} bought for ${listing.price} coins!'),
          backgroundColor: Colors.green,
        ),
      );
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
      body: sampleMarketListings.isEmpty
          ? const Center(
        child: Text(
          'No listings available',
          style: TextStyle(color: Colors.white54, fontSize: 16),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: sampleMarketListings.length,
        itemBuilder: (context, index) {
          final item = sampleMarketListings[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF131A29),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.amberAccent.withOpacity(0.4)),
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
                        '${item.card.rating}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                      ),
                      Text(
                        item.card.position,
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
                        item.card.name,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        'Seller: ${item.sellerName}',
                        style: const TextStyle(color: Colors.white54, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () => _buyCard(item),
                  child: Text(
                    '${item.price} 🪙',
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