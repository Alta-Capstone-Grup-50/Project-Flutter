import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hospital_management_system/utilities/constants/api_url.dart';

class DeleteManageService {
  final Dio _dio = Dio();

  Future<Response> deleteDataAccountApi(String id) async {
    Response response;

    response = await _dio
        .delete(
      '${ApiUrl.deleteDataManage}/$id',
    )
        .onError((error, stackTrace) {
      // log(error.toString());
      throw error!;
    });

    return response;
  }
}
