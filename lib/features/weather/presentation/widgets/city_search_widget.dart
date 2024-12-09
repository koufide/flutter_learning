import 'package:fik_weather/features/weather/presentation/bloc/weather_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitySearchWidget extends StatefulWidget {
  const CitySearchWidget({super.key});

  @override
  State<CitySearchWidget> createState() => _CitySearchWidgetState();
}

class _CitySearchWidgetState   extends State<CitySearchWidget> {
  final _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _cityController,
              decoration: InputDecoration(
                hintText: 'Entrez un nom de ville',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              if (_cityController.text.isNotEmpty) {
                context.read().add(
                      FetchWeather(_cityController.text),
                    );
              }
            },
            child: const Text('Rechercher'),
          ),
        ],
      ),
    );
  }

@override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }


}