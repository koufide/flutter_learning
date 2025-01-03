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

import 'package:fik_weather/features/weather/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel({
    required super.cityName,
    required super.temperature,
    required super.description,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'] ?? 'Unknown',
      temperature: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
    );
  }

  Map toJson() => {
    'name': cityName,
    'main': {'temp': temperature},
    'weather': [
      {
        'description': description,
      }
    ]
  };



}