import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/goal_provider.dart';

class FocusTimerScreen extends StatefulWidget {
  final String goalId;
  final String stepId;
  final String stepTitle;
  final int minutes;

  const FocusTimerScreen({
    super.key,
    required this.goalId,
    required this.stepId,
    required this.stepTitle,
    this.minutes = 5,
  });

  @override
  State<FocusTimerScreen> createState() => _FocusTimerScreenState();
}

class _FocusTimerScreenState extends State<FocusTimerScreen> {
  late int _remainingSeconds;
  Timer? _timer;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.minutes * 60;
  }

  void _startTimer() {
    if (_timer != null) return;
    setState(() => _isRunning = true);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() => _remainingSeconds--);
      } else {
        _pauseTimer();
        _completeStep();
      }
    });
  }

  void _pauseTimer() {
    _timer?.cancel();
    _timer = null;
    setState(() => _isRunning = false);
  }

  void _resetTimer() {
    _pauseTimer();
    setState(() => _remainingSeconds = widget.minutes * 60);
  }

  void _completeStep() {
    Provider.of<GoalProvider>(context, listen: false)
        .toggleStepCompletion(widget.goalId, widget.stepId);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Чудова робота! 🎉'),
        content: const Text('Крок виконано. Його статус автоматично оновлено!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).pop();
            },
            child: const Text('ОК'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _formattedTime {
    final mins = (_remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final secs = (_remainingSeconds % 60).toString().padLeft(2, '0');
    return '$mins:$secs';
  }

  @override
  Widget build(BuildContext context) {
    final progress = 1 - (_remainingSeconds / (widget.minutes * 60));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Таймер Фокусу'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.stepTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 220,
                  height: 220,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 12,
                    backgroundColor: Colors.grey[800],
                  ),
                ),
                Text(
                  _formattedTime,
                  style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filled(
                  iconSize: 36,
                  icon: Icon(_isRunning ? Icons.pause : Icons.play_arrow),
                  onPressed: _isRunning ? _pauseTimer : _startTimer,
                ),
                const SizedBox(width: 20),
                IconButton.outlined(
                  iconSize: 36,
                  icon: const Icon(Icons.refresh),
                  onPressed: _resetTimer,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}