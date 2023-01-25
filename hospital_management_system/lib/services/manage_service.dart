import 'package:dio/dio.dart';
import 'package:hospital_management_system/models/manage_data_model.dart';
import 'package:hospital_management_system/utilities/constants/api_url.dart';

class ManageService {
  final Dio _dio = Dio();

  Future<List<DataManage>?> getDataAkunApi() async {
    try {
      var response = await _dio.get(
        ApiUrl.getDataManage,
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        var model = ManageDataModel.fromJson(response.data);
        var listData = model.dataManage;

        return listData;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
