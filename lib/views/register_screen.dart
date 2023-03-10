import 'dart:convert';

import 'package:financeinhand/controllers/auth_controller.dart';
import 'package:financeinhand/views/transactions_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final authController = AuthController();

  _registerUser() async {
    final response = await authController.registerUser(
      _nameController.text,
      _emailController.text,
      _passwordController.text,
    );

    if (response['status']) {
      print('Usuário cadastrado com sucesso');
    } else {
      print(response['message']);
    }
  }

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
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor insira um e-mail válido';
                  }
                  return null;
                },
              ),
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
                    _registerUser();
                  }
                },
                child: const Text('Entrar'),
              )
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
