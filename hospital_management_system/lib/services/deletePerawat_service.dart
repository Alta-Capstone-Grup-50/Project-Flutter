import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hospital_management_system/utilities/constants/api_url.dart';

class DeletePerawatService {
  final Dio _dio = Dio();

  Future<Response> deleteDataPerawatApi(String id) async {
    Response response;

    response = await _dio
        .delete(
      '${ApiUrl.deleteDataPerawat}/$id',
    )
        .onError((error, stackTrace) {
      log(error.toString());
      throw error!;
    });

    return response;
  }
}
