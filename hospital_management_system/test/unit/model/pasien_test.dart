import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hospital_management_system/models/pasien/create/pasien_create_model.dart';
import 'package:hospital_management_system/models/pasien/data/pasien_data_model.dart';
import 'package:hospital_management_system/models/pasien/data/pasien_model.dart';

import '../utils.dart';

void main() {
  group("PasienModel >>", () {
    // Dummy Data
    const pathDataResponse = "data/data_pasien_success.json";
    const pathCreateResonse = "data/create_pasien_success.json";
    const pathUpdateResponse = "data/update_pasien_success.json";

    final responseGet = Utils.readJson(pathDataResponse);
    final responsePost = Utils.readJson(pathCreateResonse);
    final responsePut = Utils.readJson(pathUpdateResponse);

    group("Testing *Data >>", () {
      test("PasienModel Information ", () {
        Map<String, dynamic> value = jsonDecode(responseGet);
        final dataPasien = PasienDataModel.fromJson(value);

        expect(dataPasien, isA<PasienDataModel>());
      });
      test("PasienModel Data", () {
        Map<String, dynamic> value = jsonDecode(responseGet);
        final dataPasien = PasienDataModel.fromJson(value);

        expect(dataPasien.data, isA<List<PasienModel>>());
      });
    });
    test("Testing Create PasienModel", () {
      Map<String, dynamic> data = {};
      Map<String, dynamic> json = jsonDecode(responsePost);

      json.map((key, value) => MapEntry(key, data[key] = value));

      const dataPasien = PasienCreateModel(
          nik: "351111050575302552",
          nama: "Genjo",
          jenisKelamin: "L",
          poli: "Gigi",
          alamat: "Jl Duta no 32 RT 02 RW 05 Kranji, Bekasi Barat, Bekasi",
          noTelepon: "082122019242",
          tempatLahir: "Jakarta",
          tanggalLahir: "11 Desember 2001",
          jenisPenanganan: "Rawat jalan");

      expect(dataPasien, anyOf(isA<PasienCreateModel>()));
      expect(dataPasien.toJson(), equals(data['data']));
    });
    test("Testing Update PasienModel", () {
      Map<String, dynamic> data = {};
      Map<String, dynamic> json = jsonDecode(responsePut);

      json.map((key, value) => MapEntry(key, data[key] = value));

      const dataPasien = PasienCreateModel(
          nik: "330709815",
          nama: "Yusuf",
          alamat: "Tuban, Banyuwangi",
          jenisKelamin: "P",
          poli: "Gigi",
          noTelepon: "083720012964",
          tempatLahir: "Peterongan",
          tanggalLahir: "1999-12-18");

      expect(dataPasien, anyOf(isA<PasienCreateModel>()));
      expect(dataPasien.toJson(), isNotEmpty);
      expect(dataPasien.nik, equals(data['data']['nik']));
      expect(dataPasien.nama, equals(data['data']['nama']));
    });
  });
}
