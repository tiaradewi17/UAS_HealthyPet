import 'dart:convert';
import 'package:healthypet/models/klinik_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class Repository {
  final String apiUrl = "https://uas-healthypet-default-rtdb.firebaseio.com/klinik.json";

  Future<List<KlinikModel>> fetchDataPlaces() async {
    Response response = await http.get(Uri.parse(apiUrl));
    List<KlinikModel> dataPlaces;
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);

      dataPlaces = jsonData.values.map((value) {
        return KlinikModel.fromJson(value);
      }).toList();

      return dataPlaces;
    } else {
      throw Exception('Failed to load data places');
    }
  }
}