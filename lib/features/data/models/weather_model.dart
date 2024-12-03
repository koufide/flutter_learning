//represente la reponse de l api meteo
// class WeatherModel {
//   final double temperature;
//   final double humidity;

//   WeatherModel({required this.temperature, required this.humidity});

//   // Méthode pour convertir la réponse JSON de l'API en un modèle
//   factory WeatherModel.fromJson(Map<String, dynamic> json ){
//     return WeatherModel(
//       temperature: json['temperature'],
//       humidity: json['humidity']
//     );
//   }


// }


// class WeatherModel {
//   const WeatherModel({required this.temperature, required this.weatherCode});

//   final double temperature;
//   final double weatherCode;
// }

import 'package:fik_weather/features/domain/entities/weather.dart';

class WeatherModel extends Weather {
  const WeatherModel({
    required String cityName,
    required double temperature,
    required String description,
  }) : super(
          cityName: cityName,
          temperature: temperature,
          description: description,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
    );
  }
}