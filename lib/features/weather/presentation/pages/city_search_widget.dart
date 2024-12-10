// import 'package:flutter/widgets.dart';

// class CitySearchWidget extends StatelessWidget {
//   CitySearchWidget({Key? key}) : super(key: key);

// }
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CitySearchWidget extends StatelessWidget {
  const CitySearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
   return TextField(
      onSubmitted: (cityName) {
        // Implémentez la logique ici (par exemple, déclencher un événement BLoC).
      },
      decoration: const InputDecoration(
        labelText: 'Enter city name',
        border: OutlineInputBorder(),
      ),
    );
  }
}