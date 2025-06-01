import 'package:flutter/material.dart';
import 'package:tareas6/clases/clima.dart';
import 'package:tareas6/servicios/climaService.dart';

class WeatherProvider with ChangeNotifier {
  final WeatherService _service = WeatherService();
  WeatherData? _weather;
  bool _isLoading = false;

  WeatherData? get weather => _weather;
  bool get isLoading => _isLoading;

  Future<void> loadWeather(String city) async {
    _isLoading = true;
    notifyListeners();

    final data = await _service.fetchWeather(city);
    _weather = data;

    _isLoading = false;
    notifyListeners();
  }
}
