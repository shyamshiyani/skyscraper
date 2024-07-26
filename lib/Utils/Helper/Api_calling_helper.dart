import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Models/weather_model.dart';

class ApiCallingHelper {
  ApiCallingHelper._();

  static ApiCallingHelper apiCallingHelper = ApiCallingHelper._();

  Future<WeatherModel?> fetchData() async {
    http.Response response = await http.get(
      Uri.parse(
        "https://api.weatherapi.com/v1/current.json?key=3cd73ba36dd847d98a4100033242607&q=jamnagar&aqi=no",
      ),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> decodedData = jsonDecode(response.body);

      WeatherModel weather = WeatherModel.fromJson(decodedData);
    }
  }
}
