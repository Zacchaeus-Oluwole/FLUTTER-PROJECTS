import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherApp(),
    );
  }
}

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  String apiKey = 'YOUR_API_KEY';
  double latitude = 35.7796;
  double longitude = -78.6382;

  Future<Map<String, dynamic>> getWeatherData() async {
    final response = await http.get(
      Uri.parse('https://api.weatherbit.io/v2.0/current?lat=$latitude&lon=$longitude&key=$apiKey&include=minutely'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: FutureBuilder(
        future: getWeatherData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            // Extract and display selected weather information from snapshot.data
            var weatherData = snapshot.data?['data'][0];
            var weatherDescription = weatherData['weather']['description'];

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('City: ${weatherData['city_name']}'),
                  Text('Temperature: ${weatherData['temp']}°C'),
                  Text('Feels Like: ${weatherData['app_temp']}°C'),
                  Text('Relative Humidity: ${weatherData['rh']}%'),
                  Text('Description: $weatherDescription'),
                  Text('Dewpoint: ${weatherData['dewpt']}°C'),
                  Text('Sunrise: ${weatherData['sunrise']}'),
                  Text('Sunset: ${weatherData['sunset']}'),
                  Text('Wind Speed: ${weatherData['wind_spd']} m/s'),
                  Text('Clouds: ${weatherData['clouds']}%'),
                  Text('Snow: ${weatherData['snow']}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
