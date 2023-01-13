import 'package:flutter/material.dart';

import 'package:myapp/pokemon_api.dart';

class PokemonDetail extends StatelessWidget {
  const PokemonDetail({super.key, required this.pokemonId});

  final int pokemonId;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchPokemonInfo(pokemonId),
        builder: (context, AsyncSnapshot<PokemonInfo> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: Text(snapshot.data!.name),
              ),
              body: Column(
                children: [
                  Image.network(genPokemonImageUrl(pokemonId)),
                  Text('Types: ${snapshot.data!.typesToString()}'),
                  Text('Ability: ${snapshot.data!.ability}'),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    color: Colors.blueAccent,
                    iconSize: 50.0,
                  ),
                ],
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text('Pokemon Detail'),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
