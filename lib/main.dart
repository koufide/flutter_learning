// import 'dart:io';

import 'package:fik_weather/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:fik_weather/features/weather/data/repositories/weather_repository_impl.dart';
// import 'package:fik_weather/features/domain/repositories/weather_repository.dart';
import 'package:fik_weather/features/weather/domain/usecases/get_weather_usecase.dart';
import 'package:fik_weather/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:fik_weather/features/weather/presentation/pages/weather_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'injection_container.dart' as di;



// void main() {
//   final client = http.Client();
//   final weatherRemoteDataSource = WeatherRemoteDataSourceImpl(client: client );
  
//   final weatherRepository = WeatherRepositoryImpl(    
//     remoteDataSource: weatherRemoteDataSource
//     );

//   final  getWeather = GetWeather(weatherRepository);

  
//   runApp( MyApp(getWeather: getWeather));
// }

// class MyApp extends StatelessWidget {
//   final GetWeather getWeather;
  


//    const MyApp({super.key, required this.getWeather});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//      return BlocProvider(
//       create: (context) => WeatherBloc(getWeather),
//       child: const MaterialApp(
//         home: WeatherPage(),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }


void main() async {
   WidgetsFlutterBinding.ensureInitialized();

   await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  const MyApp({Key ? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: BlocProvider(
  //       create: (context) => WeatherBloc(
  //         getWeather: GetWeather(
  //           WeatherRepositoryImpl(
  //             remoteDataSource: WeatherRemoteDataSourceImpl(http.Client()),
  //           ),
  //         ),
  //       ),
  //       child: WeatherPage(),
  //     ),
  //   );
  // }
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => di.sl(),
        child: const WeatherPage(),
      ),
    );
  }


}

