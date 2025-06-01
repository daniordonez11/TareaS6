import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:tareas6/servicios/climaProvider.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final String city = 'Tegucigalpa';

  @override
  void initState() {
    super.initState();
    _fetchWeather();
    _startAutoRefresh();
  }

  void _fetchWeather() {
    Provider.of<WeatherProvider>(context, listen: false).loadWeather(city);
  }

  void _startAutoRefresh() {
    Future.delayed(const Duration(minutes: 5), () {
      if (mounted) {
        _fetchWeather();
        _startAutoRefresh();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);
    final data = provider.weather;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clima Actual'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchWeather,
          )
        ],
      ),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : data == null
              ? const Center(child: Text('No se pudo obtener el clima.'))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("LA CEIBA", style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                      Text('${data.temperature}°C', style: const TextStyle(fontSize: 48)),
                      Text(data.description, style: const TextStyle(fontSize: 24)),
                      const SizedBox(height: 10),
                      Text('Viento: ${data.windSpeed} m/s'),
                      const SizedBox(height: 10),
                      Text('Actualizado: ${DateFormat.Hm().format(data.dateTime)}'),
                    ],
                  ),
                ),
    ));
  }
}
