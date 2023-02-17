import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:testing/genshin_character.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({super.key});

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Genshin Impact Characters'),
      ),
      body: FutureBuilder<GenshinCharacters>(
          future: fetchCharacters(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.genshinCharacters.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data!.genshinCharacters[index]),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
