import 'package:flutter/material.dart';
import '../../../models/sbc_challenge.dart';
import 'sbc_builder_screen.dart';

class SBCListScreen extends StatefulWidget {
  const SBCListScreen({super.key});

  @override
  State<SBCListScreen> createState() => _SBCListScreenState();
}

class _SBCListScreenState extends State<SBCListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090D16),
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text('SBC CHALLENGES', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: sampleSBCs.length,
        itemBuilder: (context, index) {
          final sbc = sampleSBCs[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF131A29),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: sbc.isCompleted ? Colors.greenAccent : Colors.amber,
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  sbc.isCompleted ? Icons.check_circle : Icons.workspace_premium,
                  size: 40,
                  color: sbc.isCompleted ? Colors.greenAccent : Colors.amber,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sbc.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        sbc.description,
                        style: const TextStyle(color: Colors.white54, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: sbc.isCompleted ? Colors.grey : Colors.amber,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: sbc.isCompleted
                      ? null
                      : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SBCBuilderScreen(sbc: sbc),
                      ),
                    ).then((_) => setState(() {}));
                  },
                  child: Text(
                    sbc.isCompleted ? 'DONE' : 'BUILD',
                    style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}