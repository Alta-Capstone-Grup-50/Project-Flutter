import 'package:dio/dio.dart';
import 'package:hospital_management_system/utilities/constants/api_url.dart';

class UpdateDokterService {
  final Dio _dio = Dio();

  Future<Response> updateDataDokterApi(
      int id, Map<String, dynamic> data) async {
    Response response;

    response = await _dio
        .put(
      '${ApiUrl.updateDataDokter}/$id',
      data: data,
    )
        .onError((error, stackTrace) {
      throw error!;
    });

    return response;
  }
}
