import 'package:fik_weather/features/weather/domain/entities/weather_entity.dart';
import 'package:flutter/widgets.dart';

class WeatherDetailsWidget extends StatelessWidget {
  final WeatherEntity weather;

  const WeatherDetailsWidget({Key? key, required this.weather}):super(key: key);

  @override
  Widget build(BuildContext context) {
     return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'City: ${weather.cityName}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          'Temperature: ${weather.temperature}°C',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}