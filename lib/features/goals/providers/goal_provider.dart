import 'package:flutter/foundation.dart';
import '../models/goal_model.dart';
import '../models/micro_step_model.dart';

class GoalProvider extends ChangeNotifier {
  final List<Goal> _goals = [];

  List<Goal> get goals => List.unmodifiable(_goals);

  void addGoal(Goal goal) {
    _goals.add(goal);
    notifyListeners();
  }

  void deleteGoal(String goalId) {
    _goals.removeWhere((goal) => goal.id == goalId);
    notifyListeners();
  }

  void addStepToGoal(String goalId, MicroStep step) {
    final goalIndex = _goals.indexWhere((g) => g.id == goalId);
    if (goalIndex != -1) {
      final updatedSteps = List<MicroStep>.from(_goals[goalIndex].steps)..add(step);
      _goals[goalIndex] = _goals[goalIndex].copyWith(steps: updatedSteps);
      notifyListeners();
    }
  }

  void toggleStepCompletion(String goalId, String stepId) {
    final goalIndex = _goals.indexWhere((g) => g.id == goalId);
    if (goalIndex != -1) {
      final currentGoal = _goals[goalIndex];
      final updatedSteps = currentGoal.steps.map((step) {
        if (step.id == stepId) {
          return step.copyWith(isCompleted: !step.isCompleted);
        }
        return step;
      }).toList();

      _goals[goalIndex] = currentGoal.copyWith(steps: updatedSteps);
      notifyListeners();
    }
  }
}