import 'package:flutter/material.dart';
import '../../../models/squad.dart';
import '../../../models/player_card.dart';
import '../../../services/draft_calculator.dart';
import '../widgets/draft_pitch_grid.dart';
import '../widgets/player_pick_sheet.dart';
import 'match_simulation_screen.dart';

class DraftScreen extends StatefulWidget {
  const DraftScreen({super.key});

  @override
  State<DraftScreen> createState() => _DraftScreenState();
}

class _DraftScreenState extends State<DraftScreen> {
  DraftSquad? _squad;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showFormationPicker();
    });
  }

  bool get _isSquadComplete {
    if (_squad == null) return false;
    return _squad!.startingPlayers.values.every((player) => player != null);
  }

  void _showFormationPicker() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF131A29),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'CHOOSE FORMATION',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyanAccent,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...availableFormations.map((formation) {
                    return Card(
                      color: Colors.white10,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        dense: true,
                        title: Text(
                          formation.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          formation.positions.join(' - '),
                          style: const TextStyle(color: Colors.white54, fontSize: 11),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.cyanAccent, size: 14),
                        onTap: () {
                          setState(() {
                            _squad = DraftSquad(formation: formation);
                          });
                          Navigator.pop(context);
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onSlotTap(int index) {
    if (_squad == null) return;

    final targetPosition = _squad!.formation.positions[index];
    final shuffled = List<PlayerCard>.from(allPlayers)..shuffle();
    final options = shuffled.take(5).toList();

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return PlayerPickSheet(
          position: targetPosition,
          options: options,
          onSelect: (selectedPlayer) {
            setState(() {
              _squad!.startingPlayers[index] = selectedPlayer;
              _squad!.rating = DraftCalculator.calculateRating(_squad!);
              _squad!.chemistry = DraftCalculator.calculateChemistry(_squad!);
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090D16),
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(
          _squad != null ? 'DRAFT (${_squad!.formation.name})' : 'SELECT FORMATION',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.cyanAccent),
            onPressed: _showFormationPicker,
          ),
        ],
      ),
      body: _squad == null
          ? const Center(child: CircularProgressIndicator(color: Colors.cyanAccent))
          : SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text('RATING', style: TextStyle(color: Colors.white54, fontSize: 10)),
                        Text(
                          '${_squad!.rating}',
                          style: const TextStyle(color: Colors.amber, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text('CHEMISTRY', style: TextStyle(color: Colors.white54, fontSize: 10)),
                        Text(
                          '${_squad!.chemistry}',
                          style: const TextStyle(color: Colors.greenAccent, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.62,
                child: DraftPitchGrid(
                  squad: _squad!,
                  onSlotTap: _onSlotTap,
                ),
              ),
              if (_isSquadComplete)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MatchSimulationScreen(squad: _squad!),
                        ),
                      );
                    },
                    child: const Text(
                      'PLAY MATCH',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}