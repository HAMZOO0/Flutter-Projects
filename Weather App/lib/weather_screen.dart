import 'dart:ui';

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //main card
            SizedBox(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),

                  child: BackdropFilter(
                    //backgrop use to add blur and clipRReact use to elevate it
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 5),

                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            '26° C ',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Icon(Icons.cloud, size: 64),
                          const SizedBox(height: 16),

                          Text("Rain", style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // use to add some space
            const Text(
              // we also use align widget use to algin it like left  , right  , we also use contanier
              "Weather Forecast",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20), // use to add some space
            Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Card(D
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
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
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
                ),
              ],
            ),
            const Placeholder(
              fallbackHeight: 120,
              //  child: const Text("hi")
            ),
            const SizedBox(height: 20), // use to add some space
            const Placeholder(
              fallbackHeight: 120,
              //  child: const Text("hi")
            ),
          ],
        ),
      ),
    );
  }
}
