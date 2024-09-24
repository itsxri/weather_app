import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherInfoPage(),
    );
  }
}

class WeatherInfoPage extends StatefulWidget {
  @override
  _WeatherInfoPageState createState() => _WeatherInfoPageState();
}

class _WeatherInfoPageState extends State<WeatherInfoPage> {
  String city = '';
  String weatherCondition = '';
  String temperature = '';

  // Function to simulate fetching weather data
  void fetchWeather() {
    setState(() {
      // Simulate random weather data
      final temp = (15 + (30 - 15) * (DateTime.now().second / 60)).toStringAsFixed(1);
      final conditions = ['Sunny', 'Cloudy', 'Rainy'];
      temperature = '$temp °C';
      weatherCondition = conditions[DateTime.now().second % conditions.length];
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Input field for the city name
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter City Name',
              ),
              onChanged: (value) {
                setState(() {
                  city = value;
                });
              },
            ),
            SizedBox(height: 20),
            
            // Button to fetch weather data
            ElevatedButton(
              onPressed: fetchWeather,
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 20),

            // Display weather information if city is not empty
            if (city.isNotEmpty)
              Column(
                children: [
                  Text('City: $city', style: TextStyle(fontSize: 20)),
                  Text('Temperature: $temperature', style: TextStyle(fontSize: 20)),
                  Text('Condition: $weatherCondition', style: TextStyle(fontSize: 20)),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
