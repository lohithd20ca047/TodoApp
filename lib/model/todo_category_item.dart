class TodoCategory {
  TodoCategory({
    required this.name,
    required this.todoItems,
  });
  late final String name;
  late final List<TodoItems> todoItems;

  TodoCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    todoItems =
        List.from(json['todoItems']).map((e) => TodoItems.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['todoItems'] = todoItems.map((e) => e.toJson()).toList();
    return data;
  }
}

class TodoItems {
  TodoItems({
    this.createdDate,
    this.name,
    this.isCompleted,
    this.dueDate,
    this.completedDate,
  });
  String? createdDate;
  String? name;
  bool? isCompleted;
  String? dueDate;
  String? completedDate;

  TodoItems.fromJson(Map<String, dynamic> json) {
    createdDate = json['createdDate'];
    name = json['name'];
    isCompleted = json['isCompleted'];
    dueDate = json['dueDate'];
    completedDate = json['completedDate'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['createdDate'] = createdDate;
    data['name'] = name;
    data['isCompleted'] = isCompleted;
    data['dueDate'] = dueDate;
    data['completedDate'] = completedDate;
    return data;
  }
}
