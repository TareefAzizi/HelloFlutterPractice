import 'package:hello_flutter/data/model/todo.dart';

class TodoRepo {
  static var todos = <int, Todo>{
    0: Todo(id: 0, title: "Title 0", desc: "Description 0")
  };
  static int counter = 1;

  add(Todo todo) {
    // todos[counter] = todo.copy(id = counter)
    todos[counter] = todo.copy(id: counter);
    counter++;
  }

  Todo? getTodoById(int id) {
    return todos[id];
  }

  List<Todo> getAllTodos() {
    return todos.values.toList();
  }

  update(Todo todo) {
    if (todo.id != null) todos[todo.id!] = todo;
  }

  delete(int id) {
    todos.remove(id);
  }
}
