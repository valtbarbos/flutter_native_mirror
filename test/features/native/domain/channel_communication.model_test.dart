import 'package:flutter_native_mirror/feature/native/domain/models/models.devicekit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'when [compare] between [equatables] '
      'we achieve more coverage. yep :)', (WidgetTester tester) async {
    const asdf = DisposeResponse(id: '1');
    const fdsa = DisposeResponse(id: 'i');
    expect(asdf == fdsa, false);
  });
}
