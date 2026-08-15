import 'package:flutter/material.dart';
import '../../../models/user_data.dart';

class MyCollectionScreen extends StatelessWidget {
  const MyCollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090D16),
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text('MY COLLECTION (${UserData.myCollection.length})', style: const TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: UserData.myCollection.isEmpty
          ? const Center(
        child: Text('No cards yet! Open packs in Store.', style: TextStyle(color: Colors.white54, fontSize: 16)),
      )
          : GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.8,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: UserData.myCollection.length,
        itemBuilder: (context, index) {
          final player = UserData.myCollection[index];
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFFD4AF37),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${player.rating}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
                Text(player.position, style: const TextStyle(fontSize: 10, color: Colors.black87)),
                const SizedBox(height: 4),
                Text(player.name, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
          );
        },
      ),
    );
  }
}