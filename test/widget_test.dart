// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:restaurant_app/data/provider/done_module_provider.dart';
// import 'package:restaurant_app/main.dart';

// import 'package:flutter/foundation.dart';

// class DoneModuleProvider extends ChangeNotifier {
//   final List<String> _doneModuleList = [];

//   List<String> get doneModuleList => _doneModuleList;

//   void complete(String moduleName) {
//     _doneModuleList.add(moduleName);
//     notifyListeners();
//   }
// }

void main() {
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MainApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });

  // group('Provider Test', () {
  //   const testModuleName = 'Test Module';
  //   DoneModuleProvider doneModuleProvider;

  //   setUp(() {
  //     doneModuleProvider = DoneModuleProvider();
  //   });

  //   test('should contain new item when module completed', () {
  //     // act
  //     doneModuleProvider.complete(testModuleName);
  //     // assert
  //     var result = doneModuleProvider.doneModuleList.contains(testModuleName);
  //     expect(result, true);
  //   });

  //   test('should not contain item when module removed', () {
  //     // act
  //     doneModuleProvider.remove(testModuleName);
  //     // assert
  //     var result = doneModuleProvider.doneModuleList.contains(testModuleName);
  //     expect(result, false);
  //   });
  // });
}