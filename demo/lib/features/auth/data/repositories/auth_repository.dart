import 'package:demo/features/auth/data/datasources/auth_service.dart';
import 'package:demo/features/auth/domain/user.dart';

class AuthRepository {
  final AuthService _authService = AuthService();

  Future<User> login(String username, String password) async {
    return (await _authService.login(username, password)).toDomain();
  }
}
