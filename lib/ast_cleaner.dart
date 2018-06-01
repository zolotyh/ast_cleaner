import 'dart:io';
import 'package:analyzer/analyzer.dart';
import 'package:source_maps/refactor.dart';
import 'package:source_span/source_span.dart';
import 'package:dart_style/dart_style.dart';

String clean(String content) {
  final CompilationUnit unit = parseCompilationUnit(content);

  final sourceFile = new SourceFile.fromString(content);
  final code = new TextEditTransaction(content, sourceFile);

  unit.accept<dynamic>(new _RemoveReflectorVisitor(code));

  final printer = code.commit();
  printer.build('');

  return printer.text;
}

class _RemoveReflectorVisitor extends RecursiveAstVisitor<void> {
  TextEditTransaction code;

  _RemoveReflectorVisitor(this.code);

  @override
  void visitComment(Comment node) => _remove(node);

  void _remove(AstNode node) {
    code.edit(node.offset, node.end, '');
  }
}
