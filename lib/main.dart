import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tareas6/servicios/climaProvider.dart';
import 'package:tareas6/widgets/menu.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => WeatherProvider(),
      child: const MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }
}
