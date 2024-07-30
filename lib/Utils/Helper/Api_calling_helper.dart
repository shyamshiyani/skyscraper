import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Models/weather_model.dart';

class ApiCallingHelper {
  ApiCallingHelper._();

  static final ApiCallingHelper apiCallingHelper = ApiCallingHelper._();

  Future<WeatherModel?> fetchData(String location) async {
    final response = await http.get(
      Uri.parse(
        "https://api.weatherapi.com/v1/current.json?key=3cd73ba36dd847d98a4100033242607&q=$location&aqi=no",
      ),
    );

    // print(response.statusCode);

    if (response.statusCode == 200) {
      Map<String, dynamic> decodedData =
          jsonDecode(response.body) as Map<String, dynamic>;

      // print(decodedData);

      WeatherModel weather = WeatherModel.fromJson(decodedData);

      return weather;
    } else {
      return null;
    }
  }
}
