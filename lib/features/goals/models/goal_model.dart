import 'micro_step_model.dart';

class Goal {
  final String id;
  final String title;
  final String description;
  final DateTime? deadline;
  final List<MicroStep> steps;

  Goal({
    required this.id,
    required this.title,
    this.description = '',
    this.deadline,
    this.steps = const [],
  });

  double get progress {
    if (steps.isEmpty) return 0.0;
    final completedCount = steps.where((step) => step.isCompleted).length;
    return completedCount / steps.length;
  }

  bool get isCompleted => steps.isNotEmpty && steps.every((step) => step.isCompleted);

  Goal copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? deadline,
    List<MicroStep>? steps,
  }) {
    return Goal(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      deadline: deadline ?? this.deadline,
      steps: steps ?? this.steps,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'deadline': deadline?.toIso8601String(),
      'steps': steps.map((step) => step.toJson()).toList(),
    };
  }

  factory Goal.fromJson(Map<String, dynamic> json) {
    return Goal(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      deadline: json['deadline'] != null ? DateTime.parse(json['deadline'] as String) : null,
      steps: (json['steps'] as List<dynamic>?)
          ?.map((stepJson) => MicroStep.fromJson(stepJson as Map<String, dynamic>))
          .toList() ??
          [],
    );
  }
}