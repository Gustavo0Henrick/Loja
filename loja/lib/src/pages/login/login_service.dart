import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loja/src/core/auth_routes.dart';

class LoginService {
  
  login(String email, String password) async {
    http.Response response = await http.post(Routes.signIn,
        body: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }));
    print(response.body);
    print(response.reasonPhrase);
    if (response.statusCode == 400) {
      return "Usuario e/ou senha invalidos.";
    }
  }

  
}
