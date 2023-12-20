import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_flutter/data/model/todo.dart';
import 'package:hello_flutter/data/repository/todo_repo.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var todos = [];

  @override
  initState() {
    super.initState();
    todos = TodoRepo.todos.values.toList();
  }

  void _refresh() {
    setState(() {
      todos = TodoRepo.todos.values.toList();
    });
  }

  void _onClickAdd() async {
    Object? shouldRefresh = await context.push("/add_todo");
    debugPrint("got a value from next screen: $shouldRefresh");
    if (shouldRefresh == true) {
      _refresh();
    }
  }

  _onClickItem(int id) async {
    Object? shouldRefresh = await context.push("/update_todo/$id");
    if (shouldRefresh == true) {
      _refresh();
    }
  }

  _onDelete(int id) {
    TodoRepo().delete(id);
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Home"), backgroundColor: Colors.blue.shade300),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClickAdd,
        backgroundColor: Colors.blue.shade300,
        child: const Icon(Icons.add),
      ),
      body: Container(
        color: Colors.blue.shade50,
        child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) => GestureDetector(
              onTap: () => _onClickItem(todos[index].id),
              onDoubleTap: () => _onDelete(todos[index].id),
              child: TodoItem(key: Key("key_$index"), todo: todos[index])),
        ),
      ),
    );
  }
}

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade100,
      margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Text(
            todo.title,
            textAlign: TextAlign.left,
            style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                decoration: TextDecoration.none),
          ),
          const SizedBox(height: 8.0),
          Text(todo.desc,
              style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  decoration: TextDecoration.none))
        ]),
      ),
    );
  }
}
// u a, nu na, y, ya+ani, ya+una, ya+*na, ta, ta+ani, ta+una, ta +*na
// ta, ta + ina
