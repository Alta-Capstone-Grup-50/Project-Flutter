import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:hospital_management_system/models/perawat/data/perawat_data_model.dart';
import 'package:hospital_management_system/models/perawat/data/perawat_model.dart';
import 'package:hospital_management_system/models/perawat/update/perawat_update_model.dart';

import '../utils.dart';

void main() {
  group('PerawatModel >>', () {
    // Dummy Data
    const pathDataResponse = 'data/data_perawat_success.json';
    const pathUpdateResponse = 'data/update_perawat_success.json';

    final responseGet = Utils.readJson(pathDataResponse);
    final responsePut = Utils.readJson(pathUpdateResponse);

    group("Testing *Data >>", () {
      test("PerawatModel Infromation", () {
        Map<String, dynamic> value = jsonDecode(responseGet);
        final dataDokter = PerawatDataModel.fromJson(value);

        expect(dataDokter, isA<PerawatDataModel>());
      });
      test('PerawatModel Data', () {
        Map<String, dynamic> value = jsonDecode(responseGet);
        final dataPerawat = PerawatDataModel.fromJson(value);

        expect(dataPerawat.data, isA<List<PerawatModel>>());
      });
    });
    test("Testing Update PerawatModel", () {
      Map<String, dynamic> data = {};
      Map<String, dynamic> json = jsonDecode(responsePut);

      json.map((key, value) => MapEntry(key, data[key] = value));

      const dataPerawat = PerawatUpdateModel(
          sip: "019209518",
          nama: "Gilka Ezrya",
          jenisKelamin: "P",
          poli: "Kandungan",
          jadwalKerja: "Senin-Sabtu 08.00-16.00 WIB",
          jabatan: "Ahli Madya",
          noTelepon: "082182992210",
          noStr: "0917375095");

      expect(dataPerawat, isA<PerawatUpdateModel>());
      expect(dataPerawat.toJson(), equals(data['data']));
      expect(dataPerawat.sip, equals(data['data']['sip']));
      expect(dataPerawat.nama, equals(data['data']['nama']));
      expect(dataPerawat.jenisKelamin, equals(data['data']['jenisKelamin']));
      expect(dataPerawat.poli, equals(data['data']['poli']));
      expect(dataPerawat.jadwalKerja, equals(data['data']['jadwalKerja']));
      expect(dataPerawat.jabatan, equals(data['data']['jabatan']));
      expect(dataPerawat.noTelepon, equals(data['data']['noTelepon']));
      expect(dataPerawat.noStr, equals(data['data']['noStr']));
    });
  });
}
