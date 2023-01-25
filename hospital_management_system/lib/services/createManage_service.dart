import 'package:dio/dio.dart';
import 'package:hospital_management_system/utilities/constants/api_url.dart';

class CreateManage {
  final Dio _dio = Dio();

  Future<Response> createManageAccount(Map<String, dynamic> pasienData) async {
    Response response;

    response = await _dio
        .post(
      ApiUrl.addDataManage,
      data: pasienData,
    )
        .onError((error, stackTrace) {
      throw error!;
    });

    return response;
  }
}
