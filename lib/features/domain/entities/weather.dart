// class Weather {
//   final double temperature;
//   final double humidity;
  
//   Weather({required this.temperature, required this.humidity});
// }

class Weather {
  final String cityName;
  final double temperature;
  final String description;

  const Weather({
    required this.cityName,
    required this.temperature,
    required this.description,
  });
}