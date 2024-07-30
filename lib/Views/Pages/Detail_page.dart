import 'package:flutter/material.dart';

import '../../Models/weather_model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    WeatherModel data =
        ModalRoute.of(context)!.settings.arguments as WeatherModel;

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${data.name}, ${data.region}, ${data.country}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '${data.tempC}°C / ${data.tempF}°F',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "${data.conditionText}",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Feels Like: ${data.feelslikeC}°C / ${data.feelslikeF}°F',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Wind: ${data.windKph} kph / ${data.windMph} mph',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Humidity: ${data.humidity}%',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Cloud Cover: ${data.cloud}%',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Pressure: ${data.pressureMb} mb / ${data.pressureIn} in',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Precipitation: ${data.precipMm} mm / ${data.precipIn} in',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Dewpoint: ${data.dewpointC}°C / ${data.dewpointF}°F',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Visibility: ${data.visKm} km / ${data.visMiles} miles',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'UV Index: ${data.uv}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Gusts: ${data.gustKph} kph / ${data.gustMph} mph',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
