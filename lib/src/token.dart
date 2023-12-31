import 'enums.dart';

class Token {
  const Token(this.value, this.type);

  final String value;
  final TokenType type;

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'value': value, 'tokenType': type.name};
}
