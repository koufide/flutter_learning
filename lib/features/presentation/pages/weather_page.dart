import 'package:fik_weather/features/domain/entities/weather.dart';
import 'package:fik_weather/features/presentation/bloc/weather_bloc.dart';
import 'package:fik_weather/features/presentation/bloc/weather_event.dart';
import 'package:fik_weather/features/presentation/bloc/weather_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


// class WeatherPage  extends StatelessWidget {
//   const WeatherPage({super.key});

  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Weather FIK'),
//       ),  
//       body: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
//         if (state is WeatherLoading) {
//           return const Center(child: CircularProgressIndicator());
//         }else        if (state is WeatherLoaded) {
//           return Column(
//               children: [
//                 Text('Temperature: ${state.weather.temperature}°C'),
//                 Text('Humidity: ${state.weather.humidity}%'),
//               ],
//             );
//         } else if (state is WeatherError) {
//            return const Center(child: Text('Error loading weather'));
//         }
//        return Center(
//             child: ElevatedButton(
//               onPressed: () {
//                 context.read<WeatherBloc>().add(FetchWeather());
//               },
//               child: const Text('Get Weather'),
//             ),
//           );
//       }),
//     );
//   }

// }


class WeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Météo')),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial) {
            return _buildInitialInput(context);
          } else if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoaded) {
            return _buildWeatherDisplay(state);
          } else if (state is WeatherError) {
            return _buildError(state);
          }
          return Container();
        },
      ),
    );
  }

Widget _buildInitialInput(BuildContext context) {
  final TextEditingController cityController = TextEditingController();

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: cityController,
            decoration: InputDecoration(
              hintText: 'Entrez le nom d\'une ville',
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  if (cityController.text.isNotEmpty) {
                    context.read<WeatherBloc>().add(
                          FetchWeather(cityController.text.trim()),
                        );
                  }
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Recherchez la météo d\'une ville',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    ),
  );
}

  Widget _buildWeatherDisplay(WeatherLoaded state) {
    // Affichage des données météo
  }

  Widget _buildError(WeatherError state) {
    // Gestion et affichage des erreurs
  }
}