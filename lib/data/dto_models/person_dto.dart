class PersonDTO {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  PersonDTO({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory PersonDTO.fromJson(Map<String, dynamic> json) {
    return PersonDTO(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}
