import 'package:dio/dio.dart';
import 'package:hospital_management_system/utilities/constants/api_url.dart';

class CreatePasienService {
  final Dio _dio = Dio();

  Future<Response> postPasien(pasienData) async {
    Response response;

    response = await _dio
        .post(
      ApiUrl.postDataPasien,
      data: pasienData,
    )
        .onError((error, stackTrace) {
      throw error!;
    });

    return response;
  }
}
