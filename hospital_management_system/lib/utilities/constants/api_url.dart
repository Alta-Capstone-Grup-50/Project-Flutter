class ApiUrl {
  static const String baseUrl = 'https://api-capstone-heroku.herokuapp.com';

  static const String getDataPasien = '$baseUrl/admin/data_pasien';
  static const String getDataDokter = '$baseUrl/admin/data_dokter_lihat';
  static const String getDataPerawat = '$baseUrl/admin/data_perawat_lihat';
  static const String getDataPasienRawatJalan = '$baseUrl/dokter/rawat_jalan';
  static const String putDataPasienRawatJalan = '$baseUrl/dokter/rawat_jalan_ubah_proses';

  static const String baseUrlLogin =
      'https://api-capstone-heroku.herokuapp.com';

  static const String login = '$baseUrlLogin/login';
}
