class WeatherModel {
  String name;
  String region;
  String country;
  double tempC;
  double tempF;
  String conditionText;
  String conditionIcon;
  double windKph;
  int humidity;
  int cloud;
  double feelslikeC;
  double feelslikeF;
  double windMph;
  double pressureMb;
  double pressureIn;
  double precipMm;
  double precipIn;
  double dewpointC;
  double dewpointF;
  double visKm;
  double visMiles;
  double uv;
  double gustMph;
  double gustKph;

  WeatherModel({
    required this.name,
    required this.region,
    required this.country,
    required this.tempC,
    required this.tempF,
    required this.conditionText,
    required this.conditionIcon,
    required this.windKph,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windMph,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.dewpointC,
    required this.dewpointF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      name: json['location']['name'],
      region: json['location']['region'],
      country: json['location']['country'],
      tempC: json['current']['temp_c'],
      tempF: json['current']['temp_f'],
      conditionText: json['current']['condition']['text'],
      conditionIcon: json['current']['condition']['icon'],
      windKph: json['current']['wind_kph'],
      windMph: json['current']['wind_mph'],
      humidity: json['current']['humidity'],
      cloud: json['current']['cloud'],
      feelslikeC: json['current']['feelslike_c'],
      feelslikeF: json['current']['feelslike_f'],
      pressureMb: json['current']['pressure_mb'],
      pressureIn: json['current']['pressure_in'],
      precipMm: json['current']['precip_mm'],
      precipIn: json['current']['precip_in'],
      dewpointC: json['current']['dewpoint_c'],
      dewpointF: json['current']['dewpoint_f'],
      visKm: json['current']['vis_km'],
      visMiles: json['current']['vis_miles'],
      uv: json['current']['uv'],
      gustMph: json['current']['gust_mph'],
      gustKph: json['current']['gust_kph'],
    );
  }
}
