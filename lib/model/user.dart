class User {
  final String name;
  final int id;
  final String email;

  const User({
    required this.name,
    required this.id,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      id: json['id'],
      email: json['email'],
    );
  }
}
