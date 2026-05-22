import 'package:dio/dio.dart';

import '../core/network/api_endpoints.dart';
import '../core/network/dio_client.dart';

class HomeService {
  Future<Response> getPosts({
    required String token,
    required int offset,
  }) async {
    return await DioClient.dio.get(
      "${ApiEndpoints.posts}?visitType=1&limit=10&offset=$offset",

      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
  }
}
