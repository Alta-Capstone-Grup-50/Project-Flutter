class ApiUrl {
  static const String baseUrl =
      'https://rational-panther-83.hasura.app/api/rest';

  static const String getDataPasien = '$baseUrl/get/data_pasien';
  static const String addDataPasien = '$baseUrl/add/data_pasien';
  static const String updateDataPasien = '$baseUrl/update/data_pasien';
  static const String deleteDataPasien = '$baseUrl/delete/data_pasien';

  static const String getDataDokter = '$baseUrl/get/data_dokter_perawat';
  static const String addDataDokter = '$baseUrl/add/data_dokter_perawat';
  static const String updateDataDokter = '$baseUrl/update/data_dokter_perawat';
  static const String deleteDataDokter = '$baseUrl/delete/data_dokter_perawat';

  static const String baseUrlLogin =
      'https://api-capstone-heroku.herokuapp.com';

  static const String login = '$baseUrlLogin/login';

  static const String urlTesting =
      'https://api-capstone-heroku.herokuapp.com/data_pasien';
}
