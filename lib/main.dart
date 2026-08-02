import 'dart:math';

import 'package:flutter/material.dart';
import 'player_card.dart';
import 'draft_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MadFut Clone',
      theme: ThemeData.dark(),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const PackOpenerScreen(),
    const DraftScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Colors.amber,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2),
            label: 'Packs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: 'Draft',
          ),
        ],
      ),
    );
  }
}

class PackOpenerScreen extends StatefulWidget {
  const PackOpenerScreen({super.key});

  @override
  State<PackOpenerScreen> createState() => _PackOpenerScreenState();
}

class _PackOpenerScreenState extends State<PackOpenerScreen> {
  PlayerCard? openedPlayer;
  bool isOpening = false;

  void openPack() {
    setState(() {
      isOpening = true;
      openedPlayer = null;
    });

    Future.delayed(const Duration(milliseconds: 1500), () {
      final random = Random();
      final randomPlayer = allPlayers[random.nextInt(allPlayers.length)];
      setState(() {
        openedPlayer = randomPlayer;
        isOpening = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('FUT PACK OPENER', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isOpening) ...[
              const CircularProgressIndicator(color: Colors.amber),
              const SizedBox(height: 20),
              const Text('Opening Pack...', style: TextStyle(fontSize: 20, color: Colors.amber)),
            ] else if (openedPlayer != null) ...[
              PlayerCardWidget(player: openedPlayer!),
              const SizedBox(height: 30),
            ] else ...[
              Container(
                width: 180,
                height: 260,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.amber, Colors.deepOrange],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(color: Colors.amberAccent, blurRadius: 15),
                  ],
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.inventory_2, size: 80, color: Colors.black),
                      SizedBox(height: 10),
                      Text(
                        'GOLD PACK',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],

            ElevatedButton(
              onPressed: isOpening ? null : openPack,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: Text(
                openedPlayer == null ? 'OPEN PACK' : 'OPEN ANOTHER PACK',
                style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerCardWidget extends StatelessWidget {
  final PlayerCard player;

  const PlayerCardWidget({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 330,
      decoration: BoxDecoration(
        color: const Color(0xFFD4AF37),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.amberAccent, width: 3),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      '${player.rating}',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      player.position,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.sports_soccer, size: 40, color: Colors.black87),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              player.name.toUpperCase(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1.2,
              ),
            ),
            const Divider(color: Colors.black54, thickness: 1),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _statItem('PAC', player.pace),
                      _statItem('DRI', player.dribbling),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _statItem('SHO', player.shooting),
                      _statItem('DEF', player.defending),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _statItem('PAS', player.passing),
                      _statItem('PHY', player.physical),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statItem(String label, int value) {
    return Row(
      children: [
        Text(
          '$value ',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}