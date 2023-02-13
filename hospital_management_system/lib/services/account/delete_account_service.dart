import 'package:dio/dio.dart';
import 'package:hospital_management_system/utilities/constants/api_url.dart';

class DeleteAccountService {
  final Dio dio;

  DeleteAccountService({required this.dio});
  DeleteAccountService.test({required this.dio});

  Future<Response> deleteAccount(String id) async {
    Response response;

    response = await dio
        .delete(
      '${ApiUrl.deleteDataManage}/$id',
    )
        .onError((error, stackTrace) {
      throw error!;
    });

    return response;
  }
}
