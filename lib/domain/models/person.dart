class Person {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  Person({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  Person copyWith({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) {
    return Person(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      avatar: avatar ?? this.avatar,
    );
  }
}