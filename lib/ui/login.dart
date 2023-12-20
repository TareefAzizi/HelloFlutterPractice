import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _email = "";
  String? _emailError;
  var _pass = "";
  String? _passError;

  _onEmailChanged(value) {
    setState(() {
      _email = value;
      _emailError = null;
    });
  }

  _onPassChanged(value) {
    setState(() {
      _pass = value;
      _passError = null;
    });
  }

  _onClickLogin() {
    if (_email.isEmpty) {
      setState(() {
        _emailError = "Email cannot be empty";
      });
      return;
    }
    if (_pass.isEmpty) {
      setState(() {
        _passError = "Pass cannot be empty";
      });
      return;
    }
    if (_email == "kh@email.com" && _pass == "pass") {
      context.push("/home");
    } else {
      debugPrint("$_email $_pass");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onChanged: _onEmailChanged,
            decoration: InputDecoration(
                hintText: "Email",
                errorText: _emailError,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0))),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onChanged: _onPassChanged,
            decoration: InputDecoration(
                hintText: "Password",
                errorText: _passError,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0))),
          ),
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: _onClickLogin, child: const Text("Login")),
            const SizedBox(width: 16.0),
            ElevatedButton(onPressed: () => {}, child: const Text("Register"))
          ],
        )
      ]),
    );
  }
}
