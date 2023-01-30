import 'package:financeinhand/assets/constants.dart';
import 'package:http/http.dart' as http;

class AuthController {
  final String _urlDefault = Constants.http_urls['URL_API']!;

  Future<http.Response> registerUser(
      String name, String email, String password) async {
    final Uri urlRegister = Uri.parse(_urlDefault + ('/auth/register'));
    print(urlRegister);
    final Map<String, String> headers = {
      'Accept': 'application/json',
    };

    final Map<String, String> body = {
      'name': name,
      'email': email,
      'password': password
    };

    final response = await http.post(
      urlRegister,
      headers: headers,
      body: body,
    );

    print(response);
    return response;
  }

  Future<http.Response> verifiyEmailExists(String email) async {
    final Uri urlVerifyEmail = Uri.parse(_urlDefault + ('/auth/verifyemail'));
    print(urlVerifyEmail);
    final Map<String, String> headers = {
      'Accept': 'application/json',
    };

    final Map<String, String> body = {
      'email': email,
    };

    final response = await http.post(
      urlVerifyEmail,
      headers: headers,
      body: body,
    );

    print(response);
    return response;
  }
}
