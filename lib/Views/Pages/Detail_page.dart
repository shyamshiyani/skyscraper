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
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${data.name}, ${data.region}, ${data.country}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[800],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '${data.tempC}°C / ${data.tempF}°F',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blueGrey[600],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "${data.conditionText}",
                      style:
                          TextStyle(fontSize: 18, color: Colors.blueGrey[500]),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildWeatherDetailRow(Icons.thermostat, 'Feels Like',
                        '${data.feelslikeC}°C / ${data.feelslikeF}°F'),
                    _buildWeatherDetailRow(Icons.air, 'Wind',
                        '${data.windKph} kph / ${data.windMph} mph'),
                    _buildWeatherDetailRow(
                        Icons.water_drop, 'Humidity', '${data.humidity}%'),
                    _buildWeatherDetailRow(
                        Icons.cloud, 'Cloud Cover', '${data.cloud}%'),
                    _buildWeatherDetailRow(Icons.compress, 'Pressure',
                        '${data.pressureMb} mb / ${data.pressureIn} in'),
                    _buildWeatherDetailRow(Icons.opacity, 'Precipitation',
                        '${data.precipMm} mm / ${data.precipIn} in'),
                    _buildWeatherDetailRow(Icons.visibility, 'Visibility',
                        '${data.visKm} km / ${data.visMiles} miles'),
                    _buildWeatherDetailRow(
                        Icons.sunny, 'UV Index', '${data.uv}'),
                    _buildWeatherDetailRow(Icons.air, 'Gusts',
                        '${data.gustKph} kph / ${data.gustMph} mph'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.blueGrey[600]),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            '$label: $value',
            style: TextStyle(fontSize: 16, color: Colors.blueGrey[700]),
          ),
        ),
      ],
    );
  }
}
