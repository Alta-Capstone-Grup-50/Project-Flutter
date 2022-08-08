import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hospital_management_system/utilities/constants/api_url.dart';

class UpdatePerawatService {
  final Dio _dio = Dio();

  Future<Response> updateDataPerawatApi(
      String id, Map<String, dynamic> data) async {
    Response response;

    response = await _dio.put(
      '${ApiUrl.updateDataPerawat}/$id',
      data: data,
    );

    return response;
  }
}
