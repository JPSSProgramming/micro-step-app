import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/micro_step_model.dart';
import '../providers/goal_provider.dart';
import 'focus_timer_screen.dart';

class GoalDetailScreen extends StatelessWidget {
  final String goalId;

  const GoalDetailScreen({super.key, required this.goalId});

  void _showAddStepDialog(BuildContext context) {
    final titleController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Додати мікрокрок (5 хв)'),
        content: TextField(
          controller: titleController,
          decoration: const InputDecoration(
            labelText: 'Що саме треба зробити?',
            hintText: 'Наприклад: Написати 1 функцію',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Скасувати'),
          ),
          ElevatedButton(
            onPressed: () {
              if (titleController.text.trim().isNotEmpty) {
                final newStep = MicroStep(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  title: titleController.text.trim(),
                );
                Provider.of<GoalProvider>(context, listen: false)
                    .addStepToGoal(goalId, newStep);
                Navigator.of(ctx).pop();
              }
            },
            child: const Text('Додати'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GoalProvider>(
      builder: (context, goalProvider, child) {
        final goalIndex = goalProvider.goals.indexWhere((g) => g.id == goalId);

        if (goalIndex == -1) {
          return Scaffold(
            appBar: AppBar(title: const Text('Ціль не знайдена')),
            body: const Center(child: Text('Цю ціль було видалено.')),
          );
        }

        final goal = goalProvider.goals[goalIndex];

        return Scaffold(
          appBar: AppBar(
            title: Text(goal.title),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (goal.description.isNotEmpty)
                      Text(
                        goal.description,
                        style: const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Прогрес:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('${(goal.progress * 100).toInt()}%'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: goal.progress,
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                child: goal.steps.isEmpty
                    ? const Center(
                  child: Text(
                    'Мікрокроків поки немає.\nДодай перший 5-хвилинний крок!',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                )
                    : ListView.builder(
                  itemCount: goal.steps.length,
                  itemBuilder: (context, index) {
                    final step = goal.steps[index];
                    return CheckboxListTile(
                      title: Text(
                        step.title,
                        style: TextStyle(
                          decoration: step.isCompleted
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      subtitle: Text('${step.estimatedMinutes} хв'),
                      value: step.isCompleted,
                      secondary: IconButton(
                        icon: const Icon(
                          Icons.timer_outlined,
                          color: Colors.deepPurpleAccent,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => FocusTimerScreen(
                                goalId: goal.id,
                                stepId: step.id,
                                stepTitle: step.title,
                                minutes: step.estimatedMinutes,
                              ),
                            ),
                          );
                        },
                      ),
                      onChanged: (_) {
                        goalProvider.toggleStepCompletion(goal.id, step.id);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _showAddStepDialog(context),
            child: const Icon(Icons.add_task),
          ),
        );
      },
    );
  }
}