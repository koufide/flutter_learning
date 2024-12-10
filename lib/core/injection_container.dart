// import 'package:get_it/get_it.dart';
// import 'package:dio/dio.dart';
// // import 'features/weather/data/datasources/weather_remote_data_source.dart';
// import 'package:fik_weather/features/weather/data/datasources/weather_remote_data_source.dart';
// import 'package:fik_weather/features/weather/data/repositories/weather_repository_impl.dart';
// import 'package:fik_weather/features/weather/domain/repositories/weather_repository.dart';
// import 'package:fik_weather/features/weather/domain/usecases/get_weather_usecase.dart';
// import 'package:fik_weather/features/weather/presentation/bloc/weather_bloc.dart';

// final sl = GetIt.instance;

// void init() {
//   // Data
//   sl.registerLazySingleton( () => Dio() );

//   // sl.registerLazySingleton(() => WeatherRemoteDataSource(sl()));
//   sl.registerLazySingleton(
//     () => WeatherRemoteDataSource(
//       sl()
//       )
//   );
//   sl.registerLazySingleton<WeatherRepository>(
//       () => WeatherRepositoryImpl(
//         sl(),
//         )
//       );

//   // Domain
//   sl.registerLazySingleton(() => GetWeather(sl()));

//   // Presentation
//   sl.registerFactory(() => WeatherBloc(
//     sl()
//     )
//   );
// }

import 'package:fik_weather/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:fik_weather/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:fik_weather/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

// import 'features/weather/data/datasources/weather_remote_datasource.dart';
// import 'features/weather/data/repositories/weather_repository_impl.dart';
// import 'features/weather/domain/repositories/weather_repository.dart';
// import 'features/weather/domain/usecases/get_weather_usecase.dart';
import 'package:fik_weather/features/weather/domain/usecases/get_weather_usecase.dart';
// import 'features/weather/presentation/bloc/weather_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future init() async {

  // Injection de Dio
  // sl.registerLazySingleton(() => Dio());


  // BLoC
  sl.registerFactory(
    () => WeatherBloc(
      GetWeatherUseCase(sl()),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(
    () => GetWeatherUseCase(sl()),
  );

  // Repository
  sl.registerLazySingleton(
    () => WeatherRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  // Data Sources
  sl.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSourceImpl(client: sl()),
  );

  // External
  sl.registerLazySingleton(() => Dio());

  // Ajoutez également l'enregistrement du client HTTP
  sl.registerLazySingleton(() => http.Client());
}
