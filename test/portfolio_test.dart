// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolioapp/screens/data/mock_repository.dart';
import 'package:portfolioapp/screens/portfolio_screen.dart';
import 'package:portfolioapp/screens/widgets/sidebar.dart';

void main() {
  Widget buildTestWidget() {
    return MaterialApp(
      home: PortfolioPage(
        isDark: false,
        onToggleTheme: () {},
      ),
    );
  }

  testWidgets('PortfolioPage loads name', (tester) async {
    await tester.pumpWidget(buildTestWidget());
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 2));

    expect(find.text('Yamuna G'), findsWidgets);
  });


  testWidgets('Theme toggle button works', (tester) async {
    
    bool toggled = false;

    await tester.pumpWidget(MaterialApp(
      home: PortfolioPage(
        isDark: false,
        onToggleTheme: () => toggled = true,
      ),
    ));

    await tester.pump();

    await tester.tap(find.byIcon(Icons.dark_mode));
    await tester.pump();

    expect(toggled, true);
  });
}
