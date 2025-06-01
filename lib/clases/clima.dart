class WeatherData {
  final double temperature;
  final String description;
  final double windSpeed;
  final String icon;
  final DateTime dateTime;

  WeatherData({
    required this.temperature,
    required this.description,
    required this.windSpeed,
    required this.icon,
    required this.dateTime,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      temperature: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
      windSpeed: json['wind']['speed'].toDouble(),
      icon: json['weather'][0]['icon'],
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
    );
  }
}
