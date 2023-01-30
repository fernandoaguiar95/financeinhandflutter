import 'dart:convert';

import 'package:financeinhand/views/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/* class LoginApi {
  final Uri _url = Uri.http('your-api.com', '/login');

  Future<http.Response> login(String email, String password) async {
    final Map<String, String> headers = {
      'Accept': 'application/json',
    };
    final Map<String, String> body = {
      'email': email,
      'password': password,
    };

    final response =
        await http.post(_url, headers: headers, body: jsonEncode(body));

    return response;
  }
} */

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  //final _loginApi = LoginApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor insira um e-mail válido';
                  }
                  if (!value.contains('@')) {
                    return 'Por favor insira um e-mail válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor insira uma senha válida';
                  }
                  if (!hasUppercase(value)) {
                    return 'A senha deve conter pelo menos uma letra maiúscula';
                  }
                  if (!hasSpecialChar(value)) {
                    return 'A senha deve conter pelo menos um caractere especial';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    /* final response = await _loginApi.login(
                        _emailController.text, _passwordController.text);
                    if (response.statusCode == 200) {
                      print("Login realizado com sucesso!");
                      print(response.body);
                      // Aqui você pode navegar para a tela principal do aplicativo
                    } else {
                      print("Falha ao realizar login: ${response.body}");
                    } */
                  }
                },
                child: const Text('Entrar'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (ctx) => RegisterScreen()),
                  );
                },
                child: const Text('Cadastre-se'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bool hasUppercase(String value) {
  return value.contains(RegExp(r'[A-Z]'));
}

bool hasSpecialChar(String value) {
  return value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));
}
