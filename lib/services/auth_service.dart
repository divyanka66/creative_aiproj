import 'package:dio/dio.dart';

import '../core/network/api_endpoints.dart';
import '../core/network/dio_client.dart';

class AuthService {
  Future<Response?> login({
    required String email,

    required String password,
  }) async {
    try {
      Response response = await DioClient.dio.post(
        ApiEndpoints.login,

        data: {"email": email.trim(), "password": password.trim()},

        options: Options(
          headers: {"Content-Type": "application/json"},

          validateStatus: (status) {
            return status != null;
          },
        ),
      );

      print("LOGIN RESPONSE => ${response.data}");

      return response;
    } on DioException catch (e) {
      print("DIO ERROR => ${e.response?.data}");

      return e.response;
    }
  }
}
