import 'package:meta/meta.dart';

class User {
  const User(
      {@required this.name, @required this.username, @required this.image});

  final String name;
  final String username;
  final String image;

  factory User.empty() => User(image: null, name: null, username: null);
}
