import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tareas6/clases/clima.dart';

class WeatherService {
  static const String _apiKey = 'c1500a2b3f146f6c8bb9374528aee27e';
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<WeatherData?> fetchWeather(String city) async {
    final url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=La+Ceiba&appid=$_apiKey&units=metric&lang=es');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return WeatherData.fromJson(json);
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Excepción: $e');
      return null;
    }
  }
}
