import 'dart:async';
import 'dart:convert';

import 'package:financeinhand/assets/constants.dart';
import 'package:http/http.dart' as http;

class AuthController {
  final String _urlDefault = Constants.http_urls['URL_API']!;
  final _headers = {
    'Accept': 'application/json',
  };

  Future<http.Response> registerUser(
      String name, String email, String password) async {
    final Uri urlRegister = Uri.parse(_urlDefault + ('/auth/register'));
    print(urlRegister);

    final Map<String, String> body = {
      'name': name,
      'email': email,
      'password': password
    };

    final response = await http.post(
      urlRegister,
      headers: _headers,
      body: body,
    );

    print(response);
    return response;
  }

  Future<bool> verifiyEmailExists(String email) async {
    final Uri urlVerifyEmail = Uri.parse(_urlDefault + ('/auth/verifyemail'));
    print(urlVerifyEmail);

    final Map<String, String> body = {
      'email': email,
    };

    try {
      final response = await http.post(
        urlVerifyEmail,
        headers: _headers,
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
