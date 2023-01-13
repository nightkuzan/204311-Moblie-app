import 'pokemon_them.dart';

import 'pokemon_api.dart';
import 'pokemon_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  int selected = 0;

  isTapped(int index, PokemonThem pt) async {
    final pokemonthem = await fetchPokemonInfo(index + 1);
    setState(() {
      selected = index;
    });
    String them = pokemonthem.typesToString();
    pt.changeTheme(them);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<PokemonService, PokemonThem>(
        builder: (_, pokemonService, pokemonThem, __) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon List'),
          backgroundColor: pokemonThem.currentTheme,
        ),
        body: GridView.builder(
          itemCount: pokemonService.pokemonCount,
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            return GestureDetector(
              onTap: () {
                isTapped(index, pokemonThem);
              },
              child: index == selected
                  ? Container(
                      // set border width and color
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 5,
                          color: Colors.black,
                        ),
                      ),
                      child: Image.network(
                        genPokemonImageUrl(index + 1),
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      // set border width and color
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 5,
                          color: Colors.white,
                        ),
                      ),
                      child: Image.network(
                        genPokemonImageUrl(index + 1),
                        fit: BoxFit.cover,
                      ),
                    ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
        ),
      );
    });
  }
}
