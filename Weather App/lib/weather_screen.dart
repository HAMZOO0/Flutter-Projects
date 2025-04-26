import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            // IconButton more good click effect
            onPressed: () {
              print('refresh btn clicked');
            },
            icon: const Icon(Icons.refresh),
          ),
          // InkWell(
          //   // we use guesture also on the place of inkwell it just give us the click effect color
          //   onTap: () {
          //     print("refresh clicked");
          //   },
          //   child: const Icon(Icons.refresh),
          // ),
        ],
      ),
    );
  }
}
