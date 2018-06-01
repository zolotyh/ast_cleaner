import 'package:ast_cleaner/ast_cleaner.dart';


void main(){
  final testCode = """
    import 'haha.dart';

    // tetet
    /// comment
    /// trterter
    /// gfdgdfgdfg
    class Hello {
    }
  """;
  var result  =clean(testCode);
  print("**** result ****");
  print(result);
}

