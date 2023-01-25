import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/modelGhoib.dart';

class ApiService {
  late Dio _dio;

  Future<List<Results>?> getArtisDetail(String artistName) async {
 
    final response = await Dio()
        .get("https://itunes.apple.com/search?term=$artistName&entity=song");

    Map<String, dynamic> decodedData = jsonDecode(response.data);
 
    var _model = Artist.fromJson(decodedData);
    List<Results> result = _model.results!;

    return result;
  }
}
