import 'enums.dart';
import 'token.dart';

abstract class Statement {
  Statement(this.nodeType);

  final NodeType nodeType;

  Map<String, dynamic> toJson() => <String, dynamic>{'nodeType': nodeType.name};
}

abstract class Expression extends Statement {
  Expression(this.token, NodeType nodeType) : super(nodeType);

  final Token token;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'token': token.toJson(),
        'nodeType': nodeType.name,
      };
}

class Program extends Statement {
  Program() : super(NodeType.program);

  final List<Statement> statements = <Statement>[];
}

class Identifier extends Expression {
  Identifier(Token token) : super(token, NodeType.identifier);
}

class NumericLiteral extends Expression {
  NumericLiteral(Token token) : super(token, NodeType.numericLiteral);
}

class NullLiteral extends Expression {
  NullLiteral(Token token) : super(token, NodeType.nullLiteral);
}

class BinaryExpression extends Expression {
  BinaryExpression(Token operator, this.left, this.right)
      : super(operator, NodeType.binaryExpression);

  final Expression left;
  final Expression right;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'operator': token.toJson(),
        'left': left.toJson(),
        'right': right.toJson(),
        'nodeType': nodeType.name,
      };
}
