import 'dart:math';
import 'package:flutter/material.dart';
import '../../../models/player_card.dart';
import '../../../models/user_data.dart';

class FatalMatchScreen extends StatefulWidget {
  const FatalMatchScreen({super.key});

  @override
  State<FatalMatchScreen> createState() => _FatalMatchScreenState();
}

class _FatalMatchScreenState extends State<FatalMatchScreen> {
  late PlayerCard _userCard;
  late PlayerCard _opponentCard;
  String _statusMessage = 'Choose a stat to duel!';
  int _userScore = 0;
  int _opponentScore = 0;
  bool _roundEnded = false;

  @override
  void initState() {
    super.initState();
    _startNewRound();
  }

  void _startNewRound() {
    final rand = Random();
    final userList = UserData.myCollection.isNotEmpty ? UserData.myCollection : allPlayers;
    _userCard = userList[rand.nextInt(userList.length)];
    _opponentCard = allPlayers[rand.nextInt(allPlayers.length)];
    _roundEnded = false;
    _statusMessage = 'Choose a stat to duel!';
  }

  void _duel(String statName, int userVal, int oppVal) {
    if (_roundEnded) return;

    setState(() {
      _roundEnded = true;
      if (userVal > oppVal) {
        _userScore++;
        _statusMessage = 'You WIN this round! ($statName: $userVal vs $oppVal)';
      } else if (userVal < oppVal) {
        _opponentScore++;
        _statusMessage = 'You LOST this round! ($statName: $userVal vs $oppVal)';
      } else {
        _statusMessage = 'DRAW! ($statName: $userVal vs $oppVal)';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090D16),
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text('FATAL DUEL', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.redAccent.withOpacity(0.5)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('YOU: $_userScore', style: const TextStyle(color: Colors.greenAccent, fontSize: 20, fontWeight: FontWeight.bold)),
                    const Text('VS', style: TextStyle(color: Colors.redAccent, fontSize: 22, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic)),
                    Text('OPP: $_opponentScore', style: const TextStyle(color: Colors.amber, fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: _buildCardView(_userCard, 'YOUR CARD', true)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildCardView(_opponentCard, 'OPPONENT', _roundEnded)),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                _statusMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Spacer(),
              if (!_roundEnded)
                Column(
                  children: [
                    Row(
                      children: [
                        _buildStatButton('PAC', _userCard.rating, _opponentCard.rating),
                        const SizedBox(width: 8),
                        _buildStatButton('SHO', _userCard.rating - 2, _opponentCard.rating - 3),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _buildStatButton('PAS', _userCard.rating - 1, _opponentCard.rating - 1),
                        const SizedBox(width: 8),
                        _buildStatButton('DRI', _userCard.rating + 1, _opponentCard.rating),
                      ],
                    ),
                  ],
                )
              else
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () => setState(() => _startNewRound()),
                  child: const Text('NEXT ROUND', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardView(PlayerCard card, String label, bool reveal) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: reveal ? const Color(0xFFD4AF37) : Colors.white10,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber, width: 2),
      ),
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black54)),
          const SizedBox(height: 8),
          if (reveal) ...[
            Text('${card.rating}', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black)),
            Text(card.position, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black87)),
            const SizedBox(height: 8),
            Text(card.name, textAlign: TextAlign.center, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
          ] else ...[
            const Icon(Icons.help_outline, size: 50, color: Colors.white38),
            const SizedBox(height: 8),
            const Text('HIDDEN', style: TextStyle(color: Colors.white54, fontWeight: FontWeight.bold)),
          ],
        ],
      ),
    );
  }

  Widget _buildStatButton(String label, int uVal, int oVal) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF131A29),
          side: const BorderSide(color: Colors.cyanAccent),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: () => _duel(label, uVal, oVal),
        child: Text('$label ($uVal)', style: const TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold)),
      ),
    );
  }
}