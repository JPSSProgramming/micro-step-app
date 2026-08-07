import 'package:flutter/material.dart';

class Page1Packs extends StatelessWidget {
  const Page1Packs({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [Color(0xFF3B0066), Color(0xFF1A0033)],
              ),
              border: Border.all(color: Colors.purpleAccent, width: 1.5),
            ),
            child: const Center(
              child: Text(
                'Draft',
                style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Text('Сторінка 1: Packs & Draft', style: TextStyle(color: Colors.white54)),
        ],
      ),
    );
  }
}