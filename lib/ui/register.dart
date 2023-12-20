import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _email = "";
  var _pass = "";
  var _confirmPass = "";

  _onEmailChanged(value) {
    setState(() {
      _email = value;
    });
  }

  _onPassChanged(value) {
    setState(() {
      _pass = value;
    });
  }

  _onConfirmPassChanged(value) {
    setState(() {
      _confirmPass = value;
    });
  }

  _onClickLogin() {
    context.push("/login");
  }

  _onClickRegister() {
    if (_email == "kh@email.com" && _pass == "pass" && _pass == "pass") {
      context.push("/home");
    } else {
      debugPrint("$_email $_pass $_confirmPass");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onChanged: _onEmailChanged,
            decoration: InputDecoration(
                hintText: "Email",
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
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0))),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onChanged: _onConfirmPassChanged,
            decoration: InputDecoration(
                hintText: "ConfirmPassword",
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
            ElevatedButton(
                onPressed: _onClickRegister, child: const Text("Register"))
          ],
        )
      ]),
    );
  }
}
