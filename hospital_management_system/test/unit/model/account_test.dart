import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hospital_management_system/models/account/create/account_create_model.dart';
import 'package:hospital_management_system/models/account/data/account_data_model.dart';
import 'package:hospital_management_system/models/account/data/account_model.dart';
import 'package:hospital_management_system/models/account/validate/account_validate_model.dart';
import 'package:mockito/mockito.dart';

import '../utils.dart';

class AccountDummy extends Mock implements AccountCreateModel {}

void main() {
  group("AccountModel >>", () {
    String? response;

    // Dummy Data
    const pathDataResponse = 'data/data_account_success.json';

    final responseGet = Utils.readJson(pathDataResponse);

    group("Testing *Data >>", () {
      test("AccountModel Information", () {
        Map<String, dynamic> value = jsonDecode(responseGet);
        final dataAccount = AccountDataModel.fromJson(value);

        int? code = 200;

        expect(dataAccount, isA<AccountDataModel>());
        expect(dataAccount.code, code);
      });
      test("AccountModel Data ", () {
        Map<String, dynamic> value = jsonDecode(responseGet);
        final dataAccount = AccountDataModel.fromJson(value);

        dataAccount.data!.map((e) {
          expect(e, isA<AccountModel>());
          expect(
              e,
              anyOf(
                isA<AccountModel>().having(
                  (e) => e.email,
                  "email",
                  isNotNull,
                ),
                isA<AccountModel>().having(
                  (e) => e.password,
                  "password",
                  isNotNull,
                ),
              ));
        });
      });
    });
    test("Testing Create AccountModel", () {
      final accountDummy = AccountDummy();

      when(accountDummy.email).thenReturn("syafik@gmail.com");
      when(accountDummy.password).thenReturn("12345678");
      when(accountDummy.nama).thenReturn("Muhammad Syafik");

      expect(accountDummy.email, contains("@"));
    });
    test("Testing Save AccountModel", () {
      AccountDummy accountDummy = AccountDummy();

      when(accountDummy.email).thenReturn("syafik@gmail.com");
      when(accountDummy.password).thenReturn("12345678");

      if (accountDummy.email!.isNotEmpty && accountDummy.password!.isNotEmpty) {
        response = "data/validate_account_success.json";
      }

      expect(accountDummy.email, contains("@"));
      expect(
          accountDummy.password,
          hasLength(
            greaterThanOrEqualTo(8),
          ));
    });
    test("Testing Validate AccountModel", () {
      final String? responseBody;
      Map<String, dynamic> json;
      AccountValidateModel? dataValidate;

      if (response != null) {
        responseBody = Utils.readJson(response!);
        json = jsonDecode(responseBody);
        dataValidate = AccountValidateModel.fromJson(json);

        expect(dataValidate.code, 200);
      } else {
        expect(dataValidate, isNull);
      }
    });
  });
}
