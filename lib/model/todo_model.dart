class TodoModel {
  String? id;
  String? title;
  String? description;
  bool? iscompleted;

  TodoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.iscompleted,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        id: json['_id'],
        title: json['title'],
        description: json['description'],
        iscompleted: json['is_completed']);
  }
}
