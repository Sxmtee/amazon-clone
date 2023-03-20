import 'package:amazon/Constants/global_variable.dart';
import 'package:amazon/Models/user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  //sign-up user
  void signUpUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
          address: "", id: "", name: "", password: "", token: "", type: "");

      var url = Uri.parse("$uri/api/signup");
      http.post(url);
    } catch (e) {}
  }
}
