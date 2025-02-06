import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // Main entry point for the app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Info App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  // TextEditingController and other variables
  final TextEditingController _cityController = TextEditingController();
  String cityName = '';
  String temperature = '';
  String weatherCondition = '';

  // New variables for the 7-day forecast
  List<String> forecastDays = [];
  List<String> forecastTemps = [];
  List<String> forecastConditions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather Info')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // TextField for entering city name
            TextField(
              controller: _cityController,
              decoration: InputDecoration(hintText: 'Enter city name'),
            ),
            // Button to fetch current weather
            ElevatedButton(
              onPressed: () {
                setState(() {
                  cityName = _cityController.text;

                  // Simulate current weather data
                  temperature =
                      '${(15 + (30 - 15) * (DateTime.now().microsecondsSinceEpoch % 100) / 100).toStringAsFixed(0)}°C'; // Simulated temp
                  weatherCondition = ['Sunny', 'Cloudy', 'Rainy'][
                      (DateTime.now().microsecondsSinceEpoch % 3)
                          .toInt()]; // Simulated condition
                });
                _cityController
                    .clear(); // Clear the input field after the action
              },
              child: Text('Fetch Weather'),
            ),
            // Display the current weather information
            SizedBox(height: 20), // Added spacing for clarity
            Text('City: $cityName', style: TextStyle(fontSize: 18)),
            Text('Temperature: $temperature', style: TextStyle(fontSize: 18)),
            Text('Weather: $weatherCondition', style: TextStyle(fontSize: 18)),

            // Button to fetch 7-day forecast
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Simulate the 7-day weather forecast data
                  forecastDays = [
                    'Mon',
                    'Tue',
                    'Wed',
                    'Thu',
                    'Fri',
                    'Sat',
                    'Sun'
                  ];
                  forecastTemps = [
                    '25°C',
                    '26°C',
                    '27°C',
                    '24°C',
                    '22°C',
                    '21°C',
                    '23°C'
                  ];
                  forecastConditions = [
                    'Sunny',
                    'Cloudy',
                    'Rainy',
                    'Sunny',
                    'Cloudy',
                    'Rainy',
                    'Sunny'
                  ];
                });
              },
              child: Text('Fetch 7-Day Forecast'),
            ),

            // Display the 7-day weather forecast
            SizedBox(height: 20),
            Text('7-Day Forecast:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ...List.generate(
              forecastDays.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  '${forecastDays[index]}: ${forecastTemps[index]}, ${forecastConditions[index]}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
