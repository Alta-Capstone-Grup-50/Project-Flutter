class ApiUrl {
  static const String baseUrl = 'https://api-capstone-heroku.herokuapp.com';

  static const String getDataPasien = '$baseUrl/admin/data_pasien';
  static const String postDataPasien = '$baseUrl/admin/data_pasien_tambah';
  static const String deleteDataPasien = '$baseUrl/admin/data_pasien_hapus';
  static const String updateDataPasien = '$baseUrl/admin/data_pasien_edit';

  static const String getDataDokter = '$baseUrl/admin/data_dokter_lihat';
  static const String updateDataDokter = '$baseUrl/admin/data_dokter_edit';
  static const String deleteDataDokter = '$baseUrl/admin/data_dokter_hapus';

  static const String getDataPerawat = '$baseUrl/admin/data_perawat_lihat';
  static const String updateDataPerawat = '$baseUrl/admin/data_perawat_edit';
  static const String deleteDataPerawat = '$baseUrl/admin/data_perawat_hapus';

  static const String getDataPasienRawatJalan = '$baseUrl/dokter/rawat_jalan';
  static const String updateDataPasienRawatJalan =
      '$baseUrl/admin/rawat_jalan_edit';
  static const String getDataPasienRawatJalanAdmin =
      '$baseUrl/admin/rawat_jalan_lihat';
  static const String putDataPasienRawatJalan =
      '$baseUrl/dokter/rawat_jalan_edit';

  static const String getDataManage = '$baseUrl/admin/akun_tampil';
  static const String addDataManage = '$baseUrl/admin/akun_tambah';
  static const String deleteDataManage = '$baseUrl/admin/akun_hapus';

  static const String login = '$baseUrl/login';
}
