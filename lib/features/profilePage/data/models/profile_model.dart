class Profile {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final int age;
  final String address;
  final String country;

  Profile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.age,
    required this.address,
    required this.country,
  });

  factory Profile.fromJson(Map<String, dynamic> data, String documentId) {
    return Profile(
      id: documentId,
      firstName: data['firstName'] as String? ?? '',
      lastName: data['lastName'] as String? ?? '',
      email: data['email'] as String? ?? '',
      age: data['age'] as int? ?? 0,
      address: data['address'] as String? ?? '',
      country: data['country'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'age': age,
      'address': address,
      'country': country,
    };
  }
}
