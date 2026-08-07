import 'package:flutter/material.dart';
import '../../../models/user_data.dart';

class MyCardsScreen extends StatelessWidget {
  const MyCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cards = UserData.myCollection;

    return Scaffold(
      backgroundColor: const Color(0xFF090D16),
      appBar: AppBar(
        title: Text('MY CARDS (${cards.length})', style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black54,
        centerTitle: true,
      ),
      body: cards.isEmpty
          ? const Center(
        child: Text(
          'У вас поки немає карток.\nВідкрийте декілька паків у Store!',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white54, fontSize: 16),
        ),
      )
          : GridView.builder(
        padding: const EdgeInsets.all(14),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final card = cards[index];
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFFD4AF37),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.amberAccent, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.amber.withOpacity(0.2),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${card.rating}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  card.position,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black87),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    card.name,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
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