import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hospital_management_system/models/account/create/account_create_model.dart';
import 'package:hospital_management_system/services/account/account_service.dart';
import 'package:hospital_management_system/services/account/create_account_service.dart';
import 'package:hospital_management_system/services/account/delete_account_service.dart';
import 'package:hospital_management_system/utilities/constants/api_url.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'account_test.mocks.dart';

@GenerateMocks([Dio])
void main() async {
  await dotenv.load(fileName: ".env");
  MockDio dioAdapterMock = MockDio();
  late AccountService tAccountService;
  late CreateAccountService tCreateAccountService;
  late DeleteAccountService tDeleteAccountService;

  setUp(() {
    tAccountService = AccountService(dio: dioAdapterMock);
    tCreateAccountService = CreateAccountService(dio: dioAdapterMock);
    tDeleteAccountService = DeleteAccountService(dio: dioAdapterMock);
  });

  group("Account Service >>", () {
    group("Get Account >>", () {
      test("Basic Response Test", () async {
        final responsePayload = {"code": 200, "data": []};

        when(dioAdapterMock.get(ApiUrl.getDataManage)).thenAnswer((_) async =>
            Future.value(Response(
                data: responsePayload,
                statusCode: 200,
                requestOptions: RequestOptions(path: ApiUrl.getDataManage))));

        final response =
            await tAccountService.getAccount(url: ApiUrl.getDataManage);

        expect(response, []);
      });
    });
    group("Create Account >>", () {
      test("Sucess Post Account >>", () async {
        final responsePayload = {
          "code": 200,
          "data": {
            "nama": "Naufal Ulwan",
            "email": "naufalulwan63@gmail.com",
            "password": "adanofal123",
            "level": "Dokter"
          },
          "message": "Dokter Naufal Ulwan diharuskan melengkapi data sendiri"
        };

        const requestPayload = AccountCreateModel(
            nama: "Naufal Ulwan",
            email: "naufalulwan63@gmail.com",
            password: "adanofal123");

        when(dioAdapterMock.post(ApiUrl.addDataManage,
                data: requestPayload.toJson()))
            .thenAnswer((_) async => Future.value(Response(
                data: responsePayload,
                statusCode: 200,
                requestOptions: RequestOptions(path: ApiUrl.addDataManage))));

        final response =
            await tCreateAccountService.createAccount(requestPayload.toJson());
        final responseJson = jsonDecode(response.toString());
        AccountCreateModel responseModel =
            AccountCreateModel.fromJson(responseJson["data"]);
        const expected = "Naufal Ulwan";

        expect(responseJson, responsePayload);
        expect(responseModel.nama, equals(expected));
      });
      test("Failed Post Account >>", () async {
        final responsePayload = {
          "code": 400,
          "message": "Email sudah digunakan."
        };

        const requestPayload = AccountCreateModel(
            nama: "Naufal Ulwan",
            email: "naufalulwan63@gmail.com",
            password: "adanofal123");

        when(dioAdapterMock.post(ApiUrl.addDataManage,
                data: requestPayload.toJson()))
            .thenAnswer((_) async => Future.value(Response(
                data: responsePayload,
                statusCode: 400,
                requestOptions: RequestOptions(path: ApiUrl.addDataManage))));

        final response =
            await tCreateAccountService.createAccount(requestPayload.toJson());
        final responseJson = jsonDecode(response.toString());

        expect(responseJson, responsePayload);
      });
    });
    group("Delete Account >>", () {
      test("Success Delete Account", () {
        const id = 54;
        final responsePayload = {
          "code": 200,
          "data": {
            "id": 54,
            "nama": "syafik",
            "email": "syafi@gmail.com",
            "password": "12345678",
            "level": "Perawat"
          },
          "message": "Data user berhasil dihapus."
        };

        when(dioAdapterMock.delete("${ApiUrl.deleteDataManage}/$id"))
            .thenAnswer((_) async => Future.value(Response(
                data: responsePayload,
                statusCode: 200,
                requestOptions:
                    RequestOptions(path: "${ApiUrl.deleteDataManage}/$id"))));

        final response = tDeleteAccountService.deleteAccount(id.toString());

        response.then((value) {
          final responseJson = jsonDecode(value.toString());
          expect(responseJson, responsePayload);
        });
      });
      test("Failed Delete Account", () {
        const id = 54;
        final responsePayload = {
          "code": 400,
          "data": "-",
          "message": "Parameter id yang anda masukan salah."
        };

        when(dioAdapterMock.delete("${ApiUrl.deleteDataManage}/$id"))
            .thenAnswer((_) async => Future.value(Response(
                data: responsePayload,
                statusCode: 400,
                requestOptions:
                    RequestOptions(path: "${ApiUrl.deleteDataManage}/$id"))));

        final response = tDeleteAccountService.deleteAccount(id.toString());
        response.then((value) {
          final responseJson = jsonDecode(value.toString());
          expect(responseJson, responsePayload);
        });
      });
    });
  });
}
