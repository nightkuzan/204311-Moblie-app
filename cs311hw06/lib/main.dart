import 'package:cs311hw06/pokemon_them.dart';

import 'my_bottom_navigation.dart';
import 'pokemon_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyPokemonApp());
}

class MyPokemonApp extends StatelessWidget {
  const MyPokemonApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: ChangeNotifierProvider(
      //   create: (_) => PokemonService(),
      //   child: const MyBottomNavigation(),
      // ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<PokemonService>(
            create: (_) => PokemonService(),
          ),
          ChangeNotifierProvider<PokemonThem>(
            create: (_) => PokemonThem(),
          ),
        ],
        child: const MyBottomNavigation(),
      ),
    );
  }
}
