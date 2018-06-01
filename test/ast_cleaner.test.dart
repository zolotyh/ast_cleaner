import 'package:ast_cleaner/ast_cleaner.dart';
import 'package:test/test.dart';
import 'package:dart_style/dart_style.dart';

void main(){
  group("Base smoke tests", () {
    final formatter = new DartFormatter();

    test("When empty string is passed, then should return empty string", () {
      final result = clean("");
      expect(result, equals(""));
    });

    test("When contenst is \"import 'haha.dart;'\" then should return same value", (){
      final testCode = """import 'haha.dart';""";
      final result = clean(testCode);
      expect(result, equals(testCode));
    });

    test("Should clean comments", (){
      final testCode = """
        import 'haha.dart';
        /// comment
        class Hello {}
      """;

      final testCodeWithoutComments = """
        import 'haha.dart';

        class Hello {}
        """;

      final result = clean(testCode);
      expect(formatter.format(result), equals(formatter.format(testCodeWithoutComments)));
    });
  });
}
