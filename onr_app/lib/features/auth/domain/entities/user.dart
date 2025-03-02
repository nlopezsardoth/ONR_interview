class User {
  final String id;
  final String email;
  final String password;

  const User({required this.id, required this.email, required this.password});

  static const empty = User(id: "-", email: "-", password: "-");
}