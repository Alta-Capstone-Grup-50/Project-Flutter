class ApiUrl {
  static const String baseUrl = 'https://api-capstone-heroku.herokuapp.com';

  static const String getDataPasien = '$baseUrl/admin/data_pasien';
  static const String getDataDokter = '$baseUrl/admin/data_dokter_lihat';
  static const String getDataPerawat = '$baseUrl/admin/data_perawat_lihat';
  static const String getDataPasienRawatJalan = '$baseUrl/dokter/rawat_jalan';
  static const String getDataPasienRawatJalanAdmin =
      '$baseUrl/admin/rawat_jalan_lihat';
  static const String putDataPasienRawatJalan =
      '$baseUrl/dokter/rawat_jalan_ubah_proses';
  static const String getDataManage =
      'https://api-capstone-heroku.herokuapp.com/admin/akun_tampil';

  static const String login = '$baseUrl/login';
}
