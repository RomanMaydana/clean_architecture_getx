import 'package:arquitecture_clean_getx/domain/model/user.dart';
import 'package:arquitecture_clean_getx/domain/request/login_request.dart';
import 'package:arquitecture_clean_getx/domain/response/login_response.dart';

abstract class ApiRepositoryInterface {
  Future<User> getUserFromToken(String token);
  Future<LoginResponse> login(LoginRequest login);
  Future<void> logout(String token);
}
