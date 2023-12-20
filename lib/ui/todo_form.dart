import 'package:flutter/material.dart';

class TodoForm extends StatelessWidget {
  const TodoForm({
    super.key,
    this.title = "",
    this.desc = "",
    this.descError = "",
    this.titleError,
    required this.onTitleChanged,
    required this.onDescChanged,
    required this.onSumbit,
  });

  final Function(String) onTitleChanged, onDescChanged;
  final Function() onSumbit;
  final String title, desc;
  final String? titleError, descError;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        padding: const EdgeInsets.all(16.0),
        child: TextFormField(
          initialValue: title,
          onChanged: onTitleChanged,
          decoration: InputDecoration(
              hintText: "Title",
              errorText: titleError,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(16.0),
        child: TextFormField(
          initialValue: desc,
          onChanged: onDescChanged,
          decoration: InputDecoration(
              hintText: "Description",
              errorText: descError,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
        ),
      ),
      const SizedBox(
        width: 16.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: onSumbit, child: const Text("Update")),
          const SizedBox(
            width: 16.0,
          ),
        ],
      )
    ]);
  }
}
