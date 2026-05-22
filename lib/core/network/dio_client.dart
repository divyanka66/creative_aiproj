import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        "Content-Type":
        "application/json",
      },
    ),
  )
    ..httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        HttpClient client = HttpClient();
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      },
    );
}