import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_flutter/ui/add_todo.dart';
import 'package:hello_flutter/ui/home.dart';
import 'package:hello_flutter/ui/login.dart';
import 'package:hello_flutter/ui/update_todo.dart';

class Navigation extends StatelessWidget {
  Navigation({Key? key}) : super(key: key);

  final _routerConfig = GoRouter(initialLocation: "/home", routes: [
    GoRoute(path: "/login", builder: (context, state) => const Login()),
    GoRoute(path: "/home", builder: (context, state) => const Home()),
    GoRoute(path: "/add_todo", builder: (context, state) => const AddTodo()),
    GoRoute(
        path: "/update_todo/:id",
        builder: (context, state) =>
            UpdateTodo(id: state.pathParameters["id"] ?? "0"))
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Hello Flutter",
      routerConfig: _routerConfig,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
