import 'package:fik_weather/features/weather/domain/usecases/get_weather_usecase.dart';
import 'package:fik_weather/features/weather/domain/usecases/no_params.dart';
import 'package:fik_weather/features/weather/presentation/bloc/weather_event.dart';
import 'package:fik_weather/features/weather/presentation/bloc/weather_state.dart';
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

// class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
//   final GetWeather getWeather;
  

//   WeatherBloc({required this.getWeather}) : super(WeatherInitial()) {
//     on<FetchWeather>(_onFetchWeather);
//   }

//   void _onFetchWeather(FetchWeather event, Emitter<WeatherState> emit) async {
//     emit(WeatherLoading());
    
//     // final result = await getWeather(event.cityName);

//      try {
//         final weather = await getWeather(event.cityName);
//         emit(WeatherLoaded(weather));
//       } catch (_) {
//         emit(WeatherError('Failed to fetch weather'));
//       }

    
//     result.fold(
//       (failure) => emit(WeatherError(failure.message)),
//       (weather) => emit(WeatherLoaded(weather)),
//     );
//   }
// 
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;
  
  WeatherBloc(this.getWeatherUseCase) : super(WeatherInitial()) {
    on(_onFetchWeather);
    // on<FetchWeather>((event, emit) async {
    //   emit(WeatherLoading());
    //   final result = await getWeatherUseCase(event.cityName);
    //   result.fold(
    //     (failure) => emit(WeatherError()),
    //     (weather) => emit(WeatherLoaded(weather))
    //   );
    // });
  }

  Future<void> _onFetchWeather(FetchWeather event, Emitter emit) async{

    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());

      final result = await getWeatherUseCase(event.cityName);

      result.fold(
        (failure) => emit(WeatherError(failure.message)),
        (weather) => emit(WeatherLoaded(weather))
      );

      return;

    });
  }

}


