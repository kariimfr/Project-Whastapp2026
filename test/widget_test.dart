import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_first/main.dart';

void main() {
  testWidgets('WhatsApp app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Memastikan judul "WhatsApp" muncul di AppBar
    expect(find.text('WhatsApp'), findsOneWidget);

    // Memastikan ikon tab (Chat, Status/Circle, Call) ada di dalam aplikasi
    expect(find.byIcon(Icons.chat), findsOneWidget);
    expect(find.byIcon(Icons.circle_outlined), findsOneWidget);
    expect(find.byIcon(Icons.call), findsOneWidget);
  });
}
