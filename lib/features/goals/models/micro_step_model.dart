class MicroStep {
  final String id;
  final String title;
  final bool isCompleted;
  final int estimatedMinutes;

  MicroStep({
    required this.id,
    required this.title,
    this.isCompleted = false,
    this.estimatedMinutes = 5,
  });

  MicroStep copyWith({
    String? id,
    String? title,
    bool? isCompleted,
    int? estimatedMinutes,
  }) {
    return MicroStep(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      estimatedMinutes: estimatedMinutes ?? this.estimatedMinutes,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
      'estimatedMinutes': estimatedMinutes,
    };
  }

  factory MicroStep.fromJson(Map<String, dynamic> json) {
    return MicroStep(
      id: json['id'] as String,
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
      estimatedMinutes: json['estimatedMinutes'] as int? ?? 5,
    );
  }
}