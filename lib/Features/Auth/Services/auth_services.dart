import 'package:amazon/Constants/error_handling.dart';
import 'package:amazon/Constants/global_variable.dart';
import 'package:amazon/Constants/snackbar.dart';
import 'package:amazon/Models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  //sign-up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
          address: "",
          id: "",
          name: name,
          password: password,
          token: "",
          type: "",
          email: email);

      var url = Uri.parse("$uri/api/signup");
      http.Response res =
          await http.post(url, body: user.toJson(), headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, "Account Created! Login with same Credentials");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
