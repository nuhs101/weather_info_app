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
  // TextEditingController and other variables should be here
  final TextEditingController _cityController = TextEditingController();
  String cityName = '';
  String temperature = '';
  String weatherCondition = '';

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
            // Button to fetch weather
            ElevatedButton(
              onPressed: () {
                setState(() {
                  cityName = _cityController.text;

                  // Simulate weather data
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
            // Display the weather information
            SizedBox(height: 20), // Added spacing for clarity
            Text('City: $cityName', style: TextStyle(fontSize: 18)),
            Text('Temperature: $temperature', style: TextStyle(fontSize: 18)),
            Text('Weather: $weatherCondition', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
