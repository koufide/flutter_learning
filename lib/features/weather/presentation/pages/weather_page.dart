import 'package:fik_weather/features/weather/domain/entities/weather_entity.dart';
import 'package:fik_weather/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:fik_weather/features/weather/presentation/bloc/weather_event.dart';
import 'package:fik_weather/features/weather/presentation/bloc/weather_state.dart';
import 'package:fik_weather/features/weather/presentation/widgets/city_search_widget.dart';
import 'package:fik_weather/features/weather/presentation/widgets/weather_details_widget.dart';
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
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Météo')),

      // body: BlocBuilder<WeatherBloc, WeatherState>(
      //   builder: (context, state) {
      //     if (state is WeatherInitial) {
      //       return _buildInitialInput(context);
      //     } else if (state is WeatherLoading) {
      //       return const Center(child: CircularProgressIndicator());
      //     } else if (state is WeatherLoaded) {
      //       return _buildWeatherDisplay(state);
      //     } else if (state is WeatherError) {
      //       return _buildError(state);
      //     }
      //     return Container();
      //   },
      // ),

      body: BlocProvider<WeatherBloc>(
        create: (context) => context.read(),
        child: Column(
          children: [
            const CitySearchWidget(),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherInitial) {
                  // return const Center(
                  //   child: Text('Recherchez une ville'),
                  // );
                  return _buildInitialInput(context);
                } else if (state is WeatherLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is WeatherLoaded) {
                  // return WeatherDetailsWidget(weather: state.weather);
                  return _buildWeatherDisplay(state);
                } else if (state is WeatherError) {
                  // return Center(
                  //   child: Text(state.message),
                  // );
                  return _buildError(state);
                }
                // return const SizedBox.shrink();
                return const Center(
                    child: Text('Enter a city name to get the weather.'));
              },
            ),
          ],
        ),
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
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
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
            const SizedBox(height: 20),
            const Text(
              'Recherchez la météo d\'une ville',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherDisplay(WeatherLoaded state) {
    if (state.weather != null) {
      return Column(
        children: [
          Text(
            'City: ${state.weather.cityName}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'Temperature: ${state.weather.temperature}°C',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      );
    } else {
// En cas de problème ou d'absence de données
      return const SizedBox.shrink(); // Widget vide
    }
  }

  Widget _buildError(WeatherError state) {
    if (state.message.isNotEmpty) {
      return Center(
        child: Text(
          'Error: ${state.message}',
          style: const TextStyle(color: Colors.red, fontSize: 18),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      // Cas où le message d'erreur est vide
      return const Center(
        child: Text(
          'An unexpected error occurred.',
          style: TextStyle(color: Colors.red, fontSize: 18),
          textAlign: TextAlign.center,
        ),
      );
    }
  }
}
