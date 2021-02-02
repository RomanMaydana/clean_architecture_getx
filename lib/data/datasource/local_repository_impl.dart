import 'package:arquitecture_clean_getx/domain/model/user.dart';
import 'package:arquitecture_clean_getx/domain/repository/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _pref_token = 'TOKEN';
final _pref_username = 'USERNAME';
final _pref_name = 'NAME';
final _pref_image = 'IMAGE';
final _pref_dark_theme = 'THEME_DARK';
class LocalReopositoryImp extends LocalRepositoryInterface {
  @override
  Future<void> clearAllData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  @override
  Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_pref_token);
  }

  @override
  Future<String> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_token, token);
    return token;
  }

  @override
  Future<User> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final username = sharedPreferences.get(_pref_username);
    final name = sharedPreferences.get(_pref_name);
    final image = sharedPreferences.get(_pref_image);

    final user = User(username: username, name: name, image: image);

    return user;
  }

  @override
  Future<User> saveUser(User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_username, user.username);
    sharedPreferences.setString(_pref_name, user.name);
    sharedPreferences.setString(_pref_image, user.image);

    return user;
  }

  @override
  Future<bool> isDarkMode() async {
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     return sharedPreferences.getBool(_pref_dark_theme);
  }

  @override
  Future<void> saveDarkMode(bool darkMode) async{
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     sharedPreferences.setBool(_pref_dark_theme, darkMode);
  }
}
