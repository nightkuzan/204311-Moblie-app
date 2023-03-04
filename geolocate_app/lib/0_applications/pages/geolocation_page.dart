import 'package:flutter/material.dart';

class GeolocationPage extends StatefulWidget {
  const GeolocationPage({super.key});

  @override
  State<GeolocationPage> createState() => _GeolocationPageState();
}

class _GeolocationPageState extends State<GeolocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geolocation Demo'),
      ),
      body: Column(
        children: [
          const Text('Latitude: '),
          const Text('Longitude: '),
          ElevatedButton(onPressed: null, child: const Text('Get Location')),
        ],
      ),
    );
  }
}
