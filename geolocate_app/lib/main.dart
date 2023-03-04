import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:geolocate_app/1_domain/usecase/geolocation_model.dart";


void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => GeolocationModel(latitude: 0.0, longitude: 0.0),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geolocation Demo'),
      ),
      body: Placeholder(),
    );
  }
}
