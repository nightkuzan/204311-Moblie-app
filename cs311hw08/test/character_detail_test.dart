import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:cs311hw08/character_detail.dart';
import 'character_detail_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  testWidgets("throws an exception if the http call completes with an error",
      (widgettester) async {
    final client = MockClient();

    when(client.get(Uri.parse('https://api.genshin.dev/characters/albedo')))
        .thenAnswer((_) async => http.Response('Not Found', 404));

    await widgettester.pumpWidget(
        MaterialApp(home: CharacterDetail(name: "albedo", client: client)));
    await widgettester.pumpAndSettle();

    final findText = find.byType(Text);

    expect(findText, findsNWidgets(2));
  });
  testWidgets("should return column", (widgettester) async {
    final client = MockClient();

    when(client.get(Uri.parse(
            'https://api.genshin.dev/characters/albedo'))) // when client get the url
        .thenAnswer((_) async => http.Response(
            '{"name": "Albedo", "vision": "Geo", "weapon": "Sword","nation":"Mondstadt", "description":"A genius known as the Kreideprinz, he is the Chief Alchemist and Captain of the Investigation Team of the Knights of Favonius."}',
            200));
    await widgettester.pumpWidget(MaterialApp(
        home: Scaffold(body: CharacterDetail(name: 'albedo', client: client))));
    await widgettester.pumpAndSettle();

    final findColumn = find.byType(Column);
    expect(findColumn, findsOneWidget);
  });

  testWidgets('CharacterDetail should has 6 Text', (widgettester) async {
    final client = MockClient();

    when(client.get(Uri.parse(
            'https://api.genshin.dev/characters/albedo'))) // when client get the url
        .thenAnswer((_) async => http.Response(
            '{"name": "Albedo", "vision": "Geo", "weapon": "Sword","nation":"Mondstadt", "description":"A genius known as the Kreideprinz, he is the Chief Alchemist and Captain of the Investigation Team of the Knights of Favonius."}',
            200));
    await widgettester.pumpWidget(
        MaterialApp(home: CharacterDetail(name: 'albedo', client: client)));

    await widgettester.pumpAndSettle();

    final findColumn = find.byType(Text);
    expect(findColumn, findsNWidgets(6));
    // Text widgets that 6 widgets are found is the name, vision, weapon, nation, description, and the title
  });
}
