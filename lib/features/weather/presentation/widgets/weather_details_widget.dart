import 'package:fik_weather/features/weather/domain/entities/weather_entity.dart';
import 'package:flutter/material.dart';

class WeatherDetailsWidget extends StatelessWidget {
  final WeatherEntity weather;

  const WeatherDetailsWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                weather.cityName,
                // style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(height: 10),
              // Shimmer.fromColors(
              //   baseColor: Colors.blue.shade200,
              //   highlightColor: Colors.blue.shade100,
              //   child: Text(
              //     '${weather.temperature.toStringAsFixed(1)}°C',
              //     style: Theme.of(context).textTheme.headline2?.copyWith(
              //           color: Colors.blue.shade700,
              //           fontWeight: FontWeight.bold,
              //         ),
              //   ),
              // ),
              const SizedBox(height: 10),
              Text(
                weather.description,
                // style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}