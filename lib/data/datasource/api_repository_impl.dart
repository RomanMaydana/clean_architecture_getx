import 'package:arquitecture_clean_getx/domain/exception/auth_exception.dart';
import 'package:arquitecture_clean_getx/domain/model/user.dart';
import 'package:arquitecture_clean_getx/domain/repository/api_repository.dart';
import 'package:arquitecture_clean_getx/domain/response/login_response.dart';
import 'package:arquitecture_clean_getx/domain/request/login_request.dart';

class ApiRepositoryImpl extends ApiRepositoryInterface {
  @override
  Future<User> getUserFromToken(String token) async {
    Future.delayed(const Duration(seconds:  3));
    if(token == 'AA111'){
      return User(name: 'Steve Jobs', username: 'stevejobs',image: 'assets/delivery/users/stevejobs.jpg');
    } else if(token == 'AA222'){
      return User(name: 'Elon Musk', username: 'elonmusk', image: 'assets/delivery/users/elonmusk.jpg');
    }

    throw AuthException();
  }

  @override
  Future<LoginResponse> login(LoginRequest login) async {
    Future.delayed(const Duration(seconds:  3));
    if(login.username == 'stevejobs' && login.password == 'steve'){
      return LoginResponse(
        token: 'AA111',
        user: User(name: 'Steve Jobs', username: 'stevejobs',image: 'assets/delivery/users/stevejobs.jpg')
      );
    } else if(login.username == 'elonmusk' && login.password == 'elon'){
      return LoginResponse(
        token: 'AA222',
        user: User(name: 'Elon Musk', username: 'elonmusk', image: 'assets/delivery/users/elonmusk.jpg')
      );
    }
    throw AuthException();
  }

  @override
  Future<void> logout(String token) async{
    print('removing token from server');
    return;
  }
}
