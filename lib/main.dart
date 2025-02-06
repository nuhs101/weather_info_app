import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final _cityController = TextEditingController();
  String _cityName = '';
  String _temperature = '';
  String _weatherCondition = '';
  List<Map<String, String>> _forecast = [];

  void _fetchWeather() {
    setState(() {
      _cityName = _cityController.text;
      _temperature = (15 + (15 * Random().nextDouble())).toStringAsFixed(1) + '°C';
      _weatherCondition = ['Sunny', 'Cloudy', 'Rainy'][Random().nextInt(3)];
    });
  }

  void _fetch7DayForecast() {
    setState(() {
      _forecast = List.generate(7, (index) {
        return {
          'day': 'Day ${index + 1}',
          'temp': (15 + (15 * Random().nextDouble())).toStringAsFixed(1) + '°C',
          'condition': ['Sunny', 'Cloudy', 'Rainy'][Random().nextInt(3)],
        };
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Info App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter City Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _fetchWeather,
                  child: Text('Fetch Weather'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _fetch7DayForecast,
                  child: Text('7-Day Forecast'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('City: $_cityName'),
            Text('Temperature: $_temperature'),
            Text('Condition: $_weatherCondition'),
            SizedBox(height: 20),
            _forecast.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _forecast.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(_forecast[index]['day']!),
                            subtitle: Text('${_forecast[index]['temp']} - ${_forecast[index]['condition']}'),
                          ),
                        );
                      },
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
