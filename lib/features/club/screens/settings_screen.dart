import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090D16),
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text('SETTINGS', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSettingsTile(Icons.volume_up, 'Sound Effects', true),
          _buildSettingsTile(Icons.music_note, 'Music', true),
          _buildSettingsTile(Icons.vibration, 'Vibration', false),
          _buildSettingsTile(Icons.notifications, 'Notifications', true),
        ],
      ),
    );
  }

  Widget _buildSettingsTile(IconData icon, String title, bool initialValue) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF131A29),
        borderRadius: BorderRadius.circular(12),
      ),
      child: StatefulBuilder(
        builder: (context, setState) {
          bool val = initialValue;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, color: Colors.cyanAccent),
                  const SizedBox(width: 12),
                  Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
              Switch(
                value: val,
                activeColor: Colors.cyanAccent,
                onChanged: (newVal) {
                  setState(() => val = newVal);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}