import 'package:dio/dio.dart';
import 'package:hospital_management_system/models/account/data/account_data_model.dart';
import 'package:hospital_management_system/models/account/data/account_model.dart';
import 'package:hospital_management_system/utilities/constants/api_url.dart';

class AccountService {
  final Dio dio;

  AccountService({required this.dio});
  AccountService.test({required this.dio});

  Future<List<AccountModel>?> getAccount({String? url}) async {
    try {
      var response = await dio.get(
        url ?? ApiUrl.getDataManage,
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        var model = AccountDataModel.fromJson(response.data);
        var listData = model.data;

        return listData;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
