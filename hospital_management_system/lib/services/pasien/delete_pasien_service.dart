import 'package:dio/dio.dart';
import 'package:hospital_management_system/utilities/constants/api_url.dart';

class DeletePasienService {
  final Dio _dio = Dio();

  Future<Response> deletePasien(String id) async {
    Response response;

    response = await _dio
        .delete(
      '${ApiUrl.deleteDataPasien}/$id',
    )
        .onError((error, stackTrace) {
      throw error!;
    });

    return response;
  }
}
