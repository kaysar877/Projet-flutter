import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:popup_menu_td/main.dart';

void main() {
  testWidgets('app builds and shows home page', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Accueil'), findsOneWidget);
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.more_vert), findsOneWidget);
  });

  testWidgets('popup menu navigates to products page', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byIcon(Icons.more_vert));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Produits').last);
    await tester.pumpAndSettle();

    expect(find.text('Produits'), findsWidgets);
    expect(find.text('Bienvenue à la page des produits!'), findsOneWidget);
  });
}
