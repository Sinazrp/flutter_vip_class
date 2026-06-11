class Profile {
  final String name;
  final int age;
  final String email;
  final String phoneNumber;
  final String password;

  const Profile({
    required this.name,
    required this.age,
    this.email = '',
    this.phoneNumber = '',
    this.password = '',
  });

  Profile copyWith({
    String? name,
    int? age,
    String? email,
    String? phoneNumber,
    String? password,
  }) {
    return Profile(
      name: name ?? this.name,
      age: age ?? this.age,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
    );
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      name: map['name'] as String? ?? '',
      age: map['age'] as int? ?? 0,
      email: map['email'] as String? ?? '',
      phoneNumber: map['phoneNumber'] as String? ?? '',
      password: map['password'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }
}
