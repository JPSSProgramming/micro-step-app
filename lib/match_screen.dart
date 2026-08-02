import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';


class MatchScreen extends StatefulWidget {
  final int teamRating;
  final int teamChemistry;

  const MatchScreen({
    super.key,
    required this.teamRating,
    required this.teamChemistry,
  });

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  int myScore = 0;
  int opponentScore = 0;
  int minute = 0;
  bool isFinished = false;
  Timer? matchTimer;

  final List<String> matchLogs = [];
  final String opponentName = 'Real Madrid';

  @override
  void initState() {
    super.initState();
    _startMatch();
  }

  void _startMatch() {
    matchTimer = Timer.periodic(const Duration(milliseconds: 600), (timer) {
      setState(() {
        minute += 5;

        final random = Random();
        int myPower = widget.teamRating + (widget.teamChemistry ~/ 5);
        int opponentPower = 85;

        if (random.nextInt(100) < 25) {
          int chance = random.nextInt(myPower + opponentPower);
          if (chance < myPower) {
            myScore++;
            matchLogs.insert(0, "⚽ $minute' GOAL! Your team scores! ($myScore - $opponentScore)");
          } else {
            opponentScore++;
            matchLogs.insert(0, "🔴 $minute' GOAL! $opponentName scores! ($myScore - $opponentScore)");
          }
        }

        if (minute >= 90) {
          minute = 90;
          isFinished = true;
          timer.cancel();
          matchLogs.insert(0, "🏁 90' MATCH FINISHED!");
        }
      });
    });
  }

  @override
  void dispose() {
    matchTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('MATCH SIMULATION', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black54,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: const Color(0xFF1E1E2C),
            child: Column(
              children: [
                Text(
                  "$minute'",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: isFinished ? Colors.redAccent : Colors.greenAccent,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        'MY TEAM\n(Rating: ${widget.teamRating})',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      '$myScore : $opponentScore',
                      style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.amber),
                    ),
                    Expanded(
                      child: Text(
                        '$opponentName\n(Rating: 85)',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: matchLogs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2C2C3E),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      matchLogs[index],
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),

          if (isFinished)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text('BACK TO DRAFT', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
        ],
      ),
    );
  }
}