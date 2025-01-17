import 'package:flutter_solid/models/token_model.dart';
import 'package:flutter_solid/solid/data/datasource/i_token_management.dart';
import 'package:flutter_solid/solid/domain/repository/i_token_repository.dart';

class TokenRepository implements ITokenRepository {
  final ITokenManagement tokenManagement;

  TokenRepository({required this.tokenManagement});

  @override
  Future<Token> refresh() async {
    // return await tokenManagement.refresh();
    return Token(token: "12");
  }

  @override
  Future<bool> save(Token token) async {
    return await tokenManagement.save(token);
  }
}
