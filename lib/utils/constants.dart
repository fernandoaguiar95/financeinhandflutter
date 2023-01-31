class Constants {
  static Map<String, String> http_urls = {
    'URL_API': 'http://192.168.0.24:8080/financeinhand/public/api',
  };
  /* static Map<String, String> http_urls = {
    'URL_API': 'http://192.168.3.40/financeinhand/public/api',
  }; mac casa*/
  /* static Map<String, String> http_urls = {
    'URL_API': 'http://192.168.0.98/financeinhand/public/api',
  }; mac empresa*/

  static const String urlDefault =
      'http://192.168.0.24:8080/financeinhand/public/api';
/*   static const String urlDefault =
      'http://192.168.0.24:8080/financeinhand/public/api';
  static const String urlDefault =
      'http://192.168.0.24:8080/financeinhand/public/api'; */

  static const urlRegisterUser = '$urlDefault/auth/register';
  static const urlVerifyEmailExists = '$urlDefault/auth/verifyemail';
  static const urlLoginUser = '$urlDefault/auth/login';

  static Map<String, String> headersApi = {
    'Accept': 'application/json',
  };
}
