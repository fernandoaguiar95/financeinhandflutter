import 'dart:async';
import 'dart:convert';

import 'package:financeinhand/utils/constants.dart';
import 'package:http/http.dart' as http;

class AuthController {
  Future<Map<String, dynamic>> registerUser(
      String name, String email, String password) async {
    final Uri urlRegister = Uri.parse(Constants.urlRegisterUser);
    print(urlRegister);

    final Map<String, String> body = {
      'name': name,
      'email': email,
      'password': password
    };

    if (!await verifiyEmailExists(email)) {
      final response = await http.post(
        urlRegister,
        headers: Constants.headersApi,
        body: body,
      );

      final bodyReponse = jsonDecode(response.body);

      print(response);
      return {
        'status': true,
        'message': bodyReponse['message'],
      };
    } else {
      return {
        'status': false,
        'message': 'Usuário já cadastrado!',
      };
    }
  }

  Future<bool> verifiyEmailExists(String email) async {
    final Uri urlVerifyEmail = Uri.parse(Constants.urlVerifyEmailExists);
    print(urlVerifyEmail);

    final Map<String, String> body = {
      'email': email,
    };

    try {
      final response = await http.post(
        urlVerifyEmail,
        headers: Constants.headersApi,
        body: body,
      );

      final responseBody = jsonDecode(response.body);

      print(responseBody['emailExists']);
      return responseBody['emailExists'];
    } catch (e) {
      return throw e.toString();
    }
  }
}
