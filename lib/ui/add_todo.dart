import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_flutter/data/model/todo.dart';
import 'package:hello_flutter/data/repository/todo_repo.dart';
import 'package:hello_flutter/ui/widgets/widgets.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});
  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final repo = TodoRepo();
  var _title = "";
  String? _titleError;
  var _desc = "";
  String? _descError;
  _onTitleChanged(value) {
    setState(() {
      _title = value;
      _titleError = null;
    });
  }

  _onDescChanged(value) {
    setState(() {
      _desc = value;
      _descError = null;
    });
  }

  _onClickAddTodo() {
    if (_title.isEmpty) {
      setState(() {
        _titleError = "Title cannot be empty";
      });
      return;
    }
    if (_desc.isEmpty) {
      setState(() {
        _descError = "Descripiton cannot be empty";
      });
      return;
    }
    var todo = Todo(title: _title, desc: _desc);
    repo.add(todo);
    context.pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextInputField(
          onChanged: _onTitleChanged,
          error: _titleError,
          hintText: "Title",
          initValue: '',
        ),
        TextInputField(
          onChanged: _onDescChanged,
          error: _descError,
          hintText: "Description",
          initValue: '',
        ),
        const SizedBox(
          width: 16.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: _onClickAddTodo, child: const Text("Add")),
            const SizedBox(
              width: 16.0,
            ),
          ],
        )
      ]),
    );
  }
}
