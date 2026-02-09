import 'package:flutter_test/flutter_test.dart';
import 'package:mon_app_tech/app/app.dart';

void main() {
  testWidgets('App démarre correctement', (WidgetTester tester) async {
    await tester.pumpWidget(const MonApp());
    expect(find.byType(MonApp), findsOneWidget);
  });
}
