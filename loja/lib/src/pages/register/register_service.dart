import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:loja/src/core/auth_routes.dart';

class RegisterService {
  signUp(String email, String password) async {
    // Uri uri = Uri.https(Routes.signUp, "/");
    http.Response response = await http.post(Routes.signUp,
        body: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }));
    print(response.body);
  }
}
