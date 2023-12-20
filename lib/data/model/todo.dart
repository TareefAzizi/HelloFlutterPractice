class Todo {
  final int? id;
  final String title, desc;

  Todo({this.id, required this.title, required this.desc});

  @override
  String toString() {
    return "Todo($id, $title, $desc)";
  }

  Todo copy({int? id, String? title, String? desc}) {
    return Todo(
        id: id ?? this.id, title: title ?? this.title, desc: desc ?? this.desc);
  }
}
