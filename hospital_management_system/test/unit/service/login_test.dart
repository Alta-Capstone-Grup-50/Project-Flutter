import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hospital_management_system/services/login/login_service.dart';
import 'package:hospital_management_system/utilities/constants/api_url.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_test.mocks.dart';

@GenerateMocks([Dio])
void main() async {
  await dotenv.load(fileName: ".env");
  MockDio dioAdapterMock = MockDio();
  late LoginService loginService;

  setUp(() {
    loginService = LoginService();
  });

  group('Login Service >>', () {
    test('Success Response', () async {
      // Arrange
      Map<String, dynamic> payload = {
        'email': 'naufalulwan63@gmail.com',
        'password': 'adanofal123'
      };

      when(dioAdapterMock.post(ApiUrl.login, data: payload)).thenAnswer(
          (_) async => Future.value(Response(
              data: {"code": 200, "id": 52, "level": "Dokter"},
              statusCode: 200,
              requestOptions: RequestOptions(path: ApiUrl.login))));

      var service = await loginService.post(payload);

      expect(service.statusCode, 200);
    });

    test('Failed Response', () async {
      // Arrange
      Map<String, dynamic> payload = {'email': '', 'password': ''};

      when(dioAdapterMock.post(ApiUrl.login, data: payload)).thenAnswer(
          (_) async => Future.value(Response(
              data: {"code": 400, "message": "Email tidak boleh kosong"},
              statusCode: 400,
              requestOptions: RequestOptions(path: ApiUrl.login))));

      var service = await loginService.post(payload);

      expect(service.statusCode, 400);
    });
  });
}
