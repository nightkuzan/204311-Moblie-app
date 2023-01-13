// ignore_for_file: implementation_imports, unnecessary_import
import 'package:flutter/material.dart';
import 'package:myapp/pokemon_detail.dart';
import 'package:myapp/pokemon_api.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon List'),
        ),
        body: Row(
          children: [
            Expanded(
                child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const PokemonDetail(pokemonId: 1)));
              },
              child: Image.network(genPokemonImageUrl(1)),
            )),
            Expanded(
              child: Image.network(genPokemonImageUrl(2)),
            ),
            Expanded(
              child: Image.network(genPokemonImageUrl(3)),
            ),
          ],
        ));
  }
}
