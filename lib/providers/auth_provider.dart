import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;
  final AuthService _service = AuthService();
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    isLoading = true;
    notifyListeners();

    try {
      final response =
      await _service.login(

        email: email,

        password: password,
      );


      print(
          "LOGIN RESPONSE => ${response?.data}");


      if (response != null &&
          response.statusCode == 200 &&
          response.data["success"] ==
              true) {


        final String token =
        response.data["data"];

        print(
            "TOKEN => $token");


        SharedPreferences prefs =
        await SharedPreferences
            .getInstance();

        await prefs.setString(
          "token",
          token,
        );

        print(
            "TOKEN SAVED SUCCESSFULLY");

        isLoading = false;

        notifyListeners();

        return true;
      }


      print(
          "LOGIN FAILED => ${response?.data}");

    } catch (e) {

      print(
          "AUTH PROVIDER ERROR => $e");
    }

    isLoading = false;

    notifyListeners();

    return false;
  }


  Future<String> getToken() async {

    SharedPreferences prefs =
    await SharedPreferences
        .getInstance();

    return prefs.getString(
        "token") ??
        "";
  }


  Future<void> logout() async {

    SharedPreferences prefs =
    await SharedPreferences
        .getInstance();

    await prefs.clear();

    notifyListeners();
  }
}