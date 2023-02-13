import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hospital_management_system/models/rawatJalan/data/rawatJalan_data_model.dart';
import 'package:hospital_management_system/models/rawatJalan/data/rawatJalan_model.dart';
import 'package:hospital_management_system/models/rawatJalan/update/rawatJalan_update_model.dart';
import 'package:mockito/mockito.dart';

import '../utils.dart';

class UpdateRawatJalan extends Mock implements RawatJalanUpdateModel {}

void main() {
  group("RawatJalanModel >>", () {
    // Dummy Data
    const pathDataResponseDokter = "data/data_rawatJalan_dokter_success.json";
    const pathDataResponseAdmin = "data/data_rawatJalan_admin_success.json";

    final responseGetDokter = Utils.readJson(pathDataResponseDokter);
    final responseGetAdmin = Utils.readJson(pathDataResponseAdmin);

    group("Testing *Data >>", () {
      test("RawatJalanModel Information", () {
        Map<String, dynamic> valueRawatJalanDokter =
            jsonDecode(responseGetDokter);
        Map<String, dynamic> valueRawatJalanAdmin =
            jsonDecode(responseGetAdmin);

        final dataRawatJalanDokter =
            RawatJalanDataModel.fromJson(valueRawatJalanDokter);
        final dataRawatJalanAdmin =
            RawatJalanDataModel.fromJson(valueRawatJalanAdmin);

        expect(dataRawatJalanDokter, isA<RawatJalanDataModel>());
        expect(dataRawatJalanAdmin, isA<RawatJalanDataModel>());

        expect(dataRawatJalanDokter.data, isList);
        expect(dataRawatJalanAdmin.data, isList);
      });
      test("RawatJalanModel Data", () {
        Map<String, dynamic> valueRawatJalanDokter =
            jsonDecode(responseGetDokter);
        Map<String, dynamic> valueRawatJalanAdmin =
            jsonDecode(responseGetAdmin);

        final dataRawatJalanDokter =
            RawatJalanDataModel.fromJson(valueRawatJalanDokter);

        final dataRawatJalanAdmin =
            RawatJalanDataModel.fromJson(valueRawatJalanAdmin);

        expect(dataRawatJalanDokter.data, isA<List<RawatJalanModel>>());
        expect(dataRawatJalanAdmin.data, isA<List<RawatJalanModel>>());

        expect(
          dataRawatJalanDokter.data,
          anyElement(
            isA<RawatJalanModel>().having(
              (e) => e.id,
              "id",
              equals(dataRawatJalanAdmin.data!
                  .where((element) =>
                      element.id == dataRawatJalanDokter.data![0].id)
                  .first
                  .id),
            ),
          ),
        );
      });
    });
    test("Testing Update RawatJalanModel", () {
      final mock = UpdateRawatJalan();

      when(mock.jadwalRawatJalan)
          .thenReturn("Senin, 4 Juli 2022 Pukul 08.00 WIB");

      var dataUpdateRawatJalan = RawatJalanUpdateModel(
        jadwalRawatJalan: mock.jadwalRawatJalan,
      );

      expect(mock.jadwalRawatJalan, dataUpdateRawatJalan.jadwalRawatJalan);
      expect(dataUpdateRawatJalan.toJson(), isA<Map<String, dynamic>>());
    });
  });
}
