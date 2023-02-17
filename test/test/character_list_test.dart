import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'genshin_character_test.mocks.dart';
import 'package:mockito/mockito.dart';

import 'package:testing/character_list.dart';
import 'package:flutter/material.dart';

@GenerateMocks([http.Client])
void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final client = MockClient();

    when(client.get(Uri.parse('https://api.genshin.dev/characters')))
        .thenAnswer((_) async => http.Response(
            '["albedo","aloy","amber","arataki-itto","ayaka","ayato"]', 200));

    // await tester.pumpWidget(const CharacterList());
    await tester.pumpWidget(const MaterialApp(home: CharacterList()));
    await tester.pumpAndSettle();
    final findListView = find.byType(ListView);
    expect(findListView, findsOneWidget);
  });
}
