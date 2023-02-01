import 'package:dio/dio.dart';
import 'package:hospital_management_system/utilities/constants/api_url.dart';

class UpdatePasienService {
  final Dio _dio = Dio();

  Future<Response> updatePasien(String id, Map<String, dynamic> data) async {
    Response response;

    response = await _dio
        .put(
      '${ApiUrl.updateDataPasien}/$id',
      data: data,
    )
        .onError((error, stackTrace) {
      throw error!;
    });

    return response;
  }
}
