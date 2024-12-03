import 'package:fik_weather/features/domain/usecases/get_weather.dart';
import 'package:fik_weather/features/domain/usecases/no_params.dart';
import 'package:fik_weather/features/presentation/bloc/weather_event.dart';
import 'package:fik_weather/features/presentation/bloc/weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
//   final GetWeather getWeather;

//   WeatherBloc(this.getWeather) : super(WeatherInitial());

//   mapEventToState(WeatherEvent event) async* {
//     if (event is FetchWeather) {
//       yield WeatherLoading();
//       try {
//         final weather = await getWeather(NoParams());
//         yield WeatherLoaded(weather: weather);
//       } catch (_) {
//         yield WeatherError();
//       }
//     }
//   }
// }

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeather getWeather;

  WeatherBloc({required this.getWeather}) : super(WeatherInitial()) {
    on<FetchWeather>(_onFetchWeather);
  }

  void _onFetchWeather(FetchWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    
    final result = await getWeather(event.cityName);
    
    result.fold(
      (failure) => emit(WeatherError(failure.message)),
      (weather) => emit(WeatherLoaded(weather)),
    );
  }
}