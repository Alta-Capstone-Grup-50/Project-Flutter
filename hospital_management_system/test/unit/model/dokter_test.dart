import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hospital_management_system/models/dokter/data/dokter_data_model.dart';
import 'package:hospital_management_system/models/dokter/data/dokter_model.dart';
import 'package:hospital_management_system/models/dokter/update/dokter_update_model.dart';

import '../utils.dart';

void main() {
  group('DokterModel >>', () {
    // Dummy Data
    const pathDataResponse = 'data/data_dokter_success.json';
    const pathUpdateResponse = 'data/update_dokter_success.json';

    final responseGet = Utils.readJson(pathDataResponse);
    final responsePut = Utils.readJson(pathUpdateResponse);
    group("Testing *Data >>", () {
      test("DokterModel Information", () {
        Map<String, dynamic> value = jsonDecode(responseGet);
        final dataDokter = DokterDataModel.fromJson(value);

        expect(dataDokter, isA<DokterDataModel>());
      });
      test('DokterModel Data', () {
        Map<String, dynamic> value = jsonDecode(responseGet);
        final dataDokter = DokterDataModel.fromJson(value);

        expect(dataDokter.data, isA<List<DokterModel>>());
      });
    });
    test("Testing Update DokterModel", () {
      Map<String, dynamic> data = {};
      Map<String, dynamic> json = jsonDecode(responsePut);

      json.map((key, value) => MapEntry(key, data[key] = value));

      const dataDokter = DokterUpdateModel(
          sip: "019220211",
          nama: "Dr. dr. Thoriq Afanudin, Ph.D.",
          jenisKelamin: "L",
          poli: "THT",
          jadwalPraktek: "Senin-Sabtu 08.00-16.00 WIB",
          noStr: "010380210233",
          noTelepon: "082136134021");

      expect(dataDokter, isA<DokterUpdateModel>());
      expect(dataDokter.toJson(), equals(data['data']));
      expect(dataDokter.sip, equals(data['data']['sip']));
      expect(dataDokter.nama, equals(data['data']['nama']));
      expect(dataDokter.jenisKelamin, equals(data['data']['jenisKelamin']));
      expect(dataDokter.poli, equals(data['data']['poli']));
      expect(dataDokter.jadwalPraktek, equals(data['data']['jadwalPraktek']));
      expect(dataDokter.noStr, equals(data['data']['noStr']));
      expect(dataDokter.noTelepon, equals(data['data']['noTelepon']));
    });
  });
}
