import 'package:dio/dio.dart';
import 'package:hospital_management_system/utilities/constants/api_url.dart';

class CreateAccountService {
  final Dio dio;

  CreateAccountService({required this.dio});
  CreateAccountService.test({required this.dio});

  Future createAccount(Map<String, dynamic> pasienData) async {
    Response response;

    response = await dio
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
