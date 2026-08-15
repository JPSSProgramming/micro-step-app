import 'package:flutter/material.dart';
import '../../../models/squad.dart';
import '../../../services/match_simulator.dart';

class MatchSimulationScreen extends StatefulWidget {
  final DraftSquad squad;

  const MatchSimulationScreen({super.key, required this.squad});

  @override
  State<MatchSimulationScreen> createState() => _MatchSimulationScreenState();
}

class _MatchSimulationScreenState extends State<MatchSimulationScreen> {
  late MatchResult _result;

  @override
  void initState() {
    super.initState();
    _result = MatchSimulator.simulateMatch(widget.squad);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090D16),
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text('MATCH SIMULATION', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.cyanAccent.withOpacity(0.3)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('YOUR TEAM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    Text(
                      '${_result.homeGoals} : ${_result.awayGoals}',
                      style: const TextStyle(color: Colors.cyanAccent, fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    const Text('OPPONENT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: _result.events.length,
                  itemBuilder: (context, index) {
                    final event = _result.events[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: event.isGoal ? Colors.green.withOpacity(0.2) : Colors.white10,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Text(
                            '${event.minute}\'',
                            style: const TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              event.text,
                              style: TextStyle(
                                color: event.isGoal ? Colors.greenAccent : Colors.white,
                                fontWeight: event.isGoal ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyanAccent,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('FINISH DRAFT', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}