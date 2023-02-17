import 'package:http/http.dart' as http;
import 'dart:convert';

class GenshinCharacters {
  final List<String> genshinCharacters;

  const GenshinCharacters({required this.genshinCharacters});

  factory GenshinCharacters.fromJson(List<dynamic> json) {
    return GenshinCharacters(
      genshinCharacters: json.cast<String>(),
    );
  }
}

Future<GenshinCharacters> fetchCharacters(http.Client client) async {
  final response =
      await client.get(Uri.parse('https://api.genshin.dev/characters'));

  if (response.statusCode == 200) {
    return GenshinCharacters.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load characters');
  }
}
