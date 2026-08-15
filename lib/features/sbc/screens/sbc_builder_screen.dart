import 'package:flutter/material.dart';
import '../../../models/sbc_challenge.dart';
import '../../../models/user_data.dart';
import '../../../models/squad.dart';
import '../../../models/player_card.dart';
import '../../../services/draft_calculator.dart';

class SBCBuilderScreen extends StatefulWidget {
  final SBCChallenge sbc;

  const SBCBuilderScreen({super.key, required this.sbc});

  @override
  State<SBCBuilderScreen> createState() => _SBCBuilderScreenState();
}

class _SBCBuilderScreenState extends State<SBCBuilderScreen> {
  late DraftSquad _squad;

  @override
  void initState() {
    super.initState();
    _squad = DraftSquad(formation: availableFormations.first);
  }

  bool get _meetsRequirements {
    return _squad.rating >= widget.sbc.minRating &&
        _squad.chemistry >= widget.sbc.minChemistry &&
        _squad.startingPlayers.values.every((p) => p != null);
  }

  void _submitSBC() {
    if (!_meetsRequirements) return;

    setState(() {
      widget.sbc.isCompleted = true;
      UserData.coins += widget.sbc.rewardCoins;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('SBC Completed! +${widget.sbc.rewardCoins} coins!'),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090D16),
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(widget.sbc.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Rating: ${_squad.rating} / ${widget.sbc.minRating}',
                    style: TextStyle(
                      color: _squad.rating >= widget.sbc.minRating ? Colors.greenAccent : Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Chem: ${_squad.chemistry} / ${widget.sbc.minChemistry}',
                    style: TextStyle(
                      color: _squad.chemistry >= widget.sbc.minChemistry ? Colors.greenAccent : Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: 11,
                itemBuilder: (context, index) {
                  final player = _squad.startingPlayers[index];
                  return GestureDetector(
                    onTap: () {
                      if (UserData.myCollection.isNotEmpty) {
                        final picked = (List<PlayerCard>.from(UserData.myCollection)..shuffle()).first;
                        setState(() {
                          _squad.startingPlayers[index] = picked;
                          _squad.rating = DraftCalculator.calculateRating(_squad);
                          _squad.chemistry = DraftCalculator.calculateChemistry(_squad);
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: player == null ? Colors.white10 : const Color(0xFFD4AF37),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          player?.name ?? '+ Add',
                          style: TextStyle(
                            color: player == null ? Colors.white54 : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _meetsRequirements ? Colors.greenAccent : Colors.grey,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: _meetsRequirements ? _submitSBC : null,
                child: const Text('SUBMIT SBC', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}