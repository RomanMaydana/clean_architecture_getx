import 'package:meta/meta.dart';

class User {
  const User({@required this.name, @required this.username, this.image});

  final String name;
  final String username;
  final String image;
}
