import 'package:flutter/material.dart';

class weather_card extends StatelessWidget {
  const weather_card({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Card(
        elevation: 6,

        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ), // use to add boarder radius
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "03:00",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8), // use to add some space
              Icon(Icons.cloud, size: 32),
              const SizedBox(height: 8), // use to add some space
              Text(
                "32° C",
                // style: TextStyle(
                //   fontSize: 16,
                //   fontWeight: FontWeight.bold,
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
