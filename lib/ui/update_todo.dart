import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_flutter/data/model/todo.dart';
import 'package:hello_flutter/data/repository/todo_repo.dart';

import 'package:hello_flutter/ui/widgets/widgets.dart';

class UpdateTodo extends StatefulWidget {
  const UpdateTodo({super.key, required this.id});

  final String id;

  @override
  State<UpdateTodo> createState() => _UpdateTodoState();
}

class _UpdateTodoState extends State<UpdateTodo> {
  final repo = TodoRepo();
  var _title = "";
  String? _titleError;
  var _desc = "";
  String? _descError;

  late int id;

  @override
  initState() {
    super.initState();
    id = int.parse(widget.id);

    var todo = repo.getTodoById(id);
    _title = todo?.title ?? "";
    _desc = todo?.desc ?? "";
  }

  _onTitleChanged(value) {
    _title = value;

    if (_titleError == null) return;

    setState(() {
      _titleError = null;
    });
  }

  _onDescChanged(value) {
    _desc = value;

    if (_descError == null) return;

    setState(() {
      _descError = null;
    });
  }

  _onClickUpdateTodo() {
    if (_title.isEmpty) {
      setState(() {
        _titleError = "Title cannot be empty";
      });
      return;
    }
    if (_desc.isEmpty) {
      setState(() {
        _descError = "Description cannot be empty";
      });
      return;
    }
    var todo = Todo(id: id, title: _title, desc: _desc);
    debugPrint(todo.toString());
    repo.update(todo);
    context.pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextInputField(
          onChanged: _onTitleChanged,
          error: _titleError,
          hintText: "Title",
          initValue: _title,
        ),
        TextInputField(
          onChanged: _onDescChanged,
          error: _descError,
          hintText: "Description",
          initValue: _desc,
        ),
        const SizedBox(
          width: 16.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: _onClickUpdateTodo, child: const Text("Update")),
            const SizedBox(
              width: 16.0,
            ),
          ],
        )
      ]),
    );
  }
}
