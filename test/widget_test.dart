import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('O widget de texto de exemplo aparece', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: Text('IFPI - Mapa'))),
    );
    expect(find.text('IFPI - Mapa'), findsOneWidget);
  });
}
