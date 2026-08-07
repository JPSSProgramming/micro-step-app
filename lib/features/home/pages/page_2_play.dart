import 'package:flutter/material.dart';

class Page2Play extends StatelessWidget {
  const Page2Play({super.key});

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
                colors: [Color(0xFF004D40), Color(0xFF00251A)],
              ),
              border: Border.all(color: Colors.tealAccent, width: 1.5),
            ),
            child: const Center(
              child: Text(
                'Pack',
                style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Text('Сторінка 2: Fatal & Modes', style: TextStyle(color: Colors.white54)),
        ],
      ),
    );
  }
}