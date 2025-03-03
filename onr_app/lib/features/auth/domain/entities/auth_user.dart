class AuthUser {
  final String id;
  final String email;
  final String password;

  const AuthUser({required this.id, required this.email, required this.password});

  static const empty = AuthUser(id: "-", email: "-", password: "-");
}