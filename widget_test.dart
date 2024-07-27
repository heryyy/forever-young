import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:myapp/main.dart'; // Pastikan nama paket sesuai dengan proyek Anda

void main() {
  testWidgets('Lyrics app loads and displays initial content',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(LyricsApp());

    // Verify that our app displays the first line of lyrics.
    expect(
        find.text("So many adventures couldn't happen today"), findsOneWidget);
  });

  testWidgets('Lyrics app animates to next line', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(LyricsApp());

    // Verify that our app displays the first line of lyrics.
    expect(
        find.text("So many adventures couldn't happen today"), findsOneWidget);

    // Fast forward animation by pumping the timer.
    await tester.pumpAndSettle(
        Duration(milliseconds: 3000)); // Adjust duration as needed

    // Verify that our app displays the next line of lyrics.
    expect(find.text("So many songs we forgot to play"), findsOneWidget);
  });
}