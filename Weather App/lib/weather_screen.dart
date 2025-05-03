import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; //https://pub.dev/packages/flutter_dotenv
import 'hourly_weather_card.dart';
import 'additional_information_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for json convertion

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  dynamic data =
      0; // in dynamic we set int type data then we change to string or other in future :) => mara opna orignal comment aa
  dynamic date = 0;
  dynamic temp = 0;

  @override
  void initState() {
    print("init state");
    super.initState();
    print("api call");
    getWeatherData();
  }

  // asunc function to get future data
  Future<void> getWeatherData() async {
    print("function body inter");

    final String city = 'Quetta,PK';

    String apiKey = dotenv.env['API_KEY'] ?? ''; // <-- API key from .env
    final String url =
        'http://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey';

    print("📡 API Call: $url");

    final response = await http.get(Uri.parse(url));
    // print('response.statusCode :: ${response.statusCode}');
    if (response.statusCode == 200) {
      try {
        // decode JSON response
        data = jsonDecode(response.body);
        setState(() {
          temp =
              (data['list'][0]['main']['temp']) -
              273.15; // convert into kelven to clelce
        });
        date = (data['list'][0]['dt_txt']);

        print("🌆 City: $city");
        print("🌡️ Temp: $temp");
        print("📅 Date: $date");
      } catch (e) {
        print("❌ JSON Decode Error: $e");
      }
    } else {
      print("❌ HTTP Error: ${response.statusCode}");
      print("Message: ${response.body}");
    }
    print("funiotn bodu end");
  }

  @override
  Widget build(BuildContext context) {
    print("buding start $temp");
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
              print('refresh button pressed');
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
        padding: const EdgeInsets.all(10.0),
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
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            '${temp.toStringAsFixed(2)}° C ', // toStringAsFixed(2) use to print jsut 2 value of floating point
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Icon(Icons.cloud, size: 50),
                          const SizedBox(height: 10),

                          Text("Rain", style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16), // use to add some space
            const Text(
              // we also use align widget use to algin it like left  , right  , we also use contanier
              "Weather Forecast",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16), // use to add some space
            SingleChildScrollView(
              scrollDirection:
                  Axis.horizontal, // by default SingleChildScrollView widget scroll vertically
              child: Row(
                children: [
                  weather_card(
                    time: "2:00",
                    temprature: "30",
                    icon: Icons.cloud,
                  ),
                  weather_card(
                    time: "5:00",
                    temprature: "28",
                    icon: Icons.wb_sunny,
                  ),
                  weather_card(
                    time: "8:00",
                    temprature: "25",
                    icon: Icons.nightlight_round,
                  ),
                  weather_card(
                    time: "11:00",
                    temprature: "22",
                    icon: Icons.cloudy_snowing,
                  ),
                  weather_card(
                    time: "2:00",
                    temprature: "20r",
                    icon: Icons.storm,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16), // use to add some space
            const Text(
              // we also use align widget use to algin it like left  , right  , we also use contanier
              "Additional Information",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(height: 16), // use to add some space

                additional_information(
                  icon: Icons.water_drop,
                  label: "Humidity",
                  value: "90",
                ),
                additional_information(
                  icon: Icons.air,
                  label: "Wind Speed",
                  value: "6.6",
                ),

                additional_information(
                  icon: Icons.speed,
                  label: "Pressure",
                  value: "800",
                ),

                const SizedBox(height: 16), // use to add some space
              ],
            ),
          ],
        ),
      ),
    );
  }
}
