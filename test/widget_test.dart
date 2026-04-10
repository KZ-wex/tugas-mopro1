import 'package:flutter_test/flutter_test.dart';
import 'package:latihan1/main.dart'; // Pastikan 'myapp' sesuai dengan name di pubspec.yaml

void main() {
  testWidgets('Cek tampilan Form Produk', (WidgetTester tester) async {
    // Build aplikasi kita
    await tester.pumpWidget(const MyApp());

    // Cek apakah teks 'Form Produk' ada di layar
    expect(find.text('Form Produk'), findsOneWidget);
  });
}