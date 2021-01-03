import 'package:arquitecture_clean_getx/domain/model/user.dart';

class LoginResponse {
  const LoginResponse({this.token, this.user});
  final String token;
  final User user;
}
