import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/goals/providers/goal_provider.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => GoalProvider(),
      child: const MicroStepApp(),
    ),
  );
}

class MicroStepApp extends StatelessWidget {
  const MicroStepApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MicroStep',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Text(
            'MicroStep App',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}