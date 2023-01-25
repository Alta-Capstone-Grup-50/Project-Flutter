import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrl {
  static String baseUrl = dotenv.get('BASE_URL');

  static String getDataPasien = '$baseUrl/admin/data_pasien';
  static String postDataPasien = '$baseUrl/admin/data_pasien_tambah';
  static String deleteDataPasien = '$baseUrl/admin/data_pasien_hapus';
  static String updateDataPasien = '$baseUrl/admin/data_pasien_edit';

  static String getDataDokter = '$baseUrl/admin/data_dokter_lihat';
  static String updateDataDokter = '$baseUrl/admin/data_dokter_edit';
  static String deleteDataDokter = '$baseUrl/admin/data_dokter_hapus';

  static String getDataPerawat = '$baseUrl/admin/data_perawat_lihat';
  static String updateDataPerawat = '$baseUrl/admin/data_perawat_edit';
  static String deleteDataPerawat = '$baseUrl/admin/data_perawat_hapus';

  static String getDataPasienRawatJalan = '$baseUrl/dokter/rawat_jalan';
  static String updateDataPasienRawatJalan = '$baseUrl/admin/rawat_jalan_edit';
  static String getDataPasienRawatJalanAdmin =
      '$baseUrl/admin/rawat_jalan_lihat';
  static String putDataPasienRawatJalan =
      '$baseUrl/dokter/rawat_jalan_ubah_proses';

  static String getDataManage = '$baseUrl/admin/akun_tampil';
  static String addDataManage = '$baseUrl/admin/akun_tambah';
  static String deleteDataManage = '$baseUrl/admin/akun_hapus';

  static String login = '$baseUrl/login';
}
