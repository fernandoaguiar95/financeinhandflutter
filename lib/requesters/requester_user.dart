import 'package:financeinhand/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

class RequesterUser {
  registerUser(
    context,
    String name,
    String email,
    String password,
  ) async {
    final authController = AuthController();

    final response = await authController.registerUser(
      name,
      email,
      password,
    );

    print(response);

    if (response.status) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/transactionslist', (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.message),
        ),
      );
    }
  }
}
