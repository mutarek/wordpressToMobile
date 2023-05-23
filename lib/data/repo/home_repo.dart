import 'package:dio/dio.dart';

import '../../utils/appConstant.dart';
import '../model/api_response.dart';
import '../remote/dio/dio_client.dart';
import '../remote/exception/api_error_handler.dart';

class HomeRepository {
  final DioClient dioClient;

  HomeRepository({required this.dioClient});

  Future<ApiResponse> getAllPosts() async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get(AppConstant.baseUrl + AppConstant.postsUrl);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }
}
