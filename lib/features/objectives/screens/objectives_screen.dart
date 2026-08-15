import 'package:flutter/material.dart';
import '../../../models/user_data.dart';

class ObjectivesScreen extends StatefulWidget {
  const ObjectivesScreen({super.key});

  @override
  State<ObjectivesScreen> createState() => _ObjectivesScreenState();
}

class _ObjectivesScreenState extends State<ObjectivesScreen> {
  final List<Map<String, dynamic>> _objectives = [
    {'title': 'Open 1 Pack', 'reward': 2000, 'done': false},
    {'title': 'Complete 1 Draft', 'reward': 5000, 'done': false},
    {'title': 'Win 1 Fatal Match', 'reward': 3000, 'done': false},
  ];

  void _claimReward(int index) {
    if (!_objectives[index]['done']) {
      setState(() {
        _objectives[index]['done'] = true;
        UserData.coins += _objectives[index]['reward'] as int;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090D16),
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text('OBJECTIVES', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _objectives.length,
        itemBuilder: (context, index) {
          final obj = _objectives[index];
          final isDone = obj['done'] as bool;

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF131A29),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: isDone ? Colors.greenAccent : Colors.redAccent),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(obj['title'] as String, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text('+${obj['reward']} 🪙', style: const TextStyle(color: Colors.amber, fontSize: 12)),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: isDone ? Colors.grey : Colors.greenAccent),
                  onPressed: isDone ? null : () => _claimReward(index),
                  child: Text(isDone ? 'CLAIMED' : 'CLAIM', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}