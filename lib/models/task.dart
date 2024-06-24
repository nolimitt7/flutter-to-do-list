class Task {
  final int? id;
  final String title;
  final String description;
  final DateTime dueDate;
  final bool isDone;
  final int priority;

  Task({
    this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    this.isDone = false,
    this.priority = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
      'isDone': isDone ? 1 : 0,
      'priority': priority,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      dueDate: DateTime.parse(map['dueDate']),
      isDone: map['isDone'] == 1,
      priority: map['priority'],
    );
  }
}
