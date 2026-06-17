enum Gender { male, female, other }

class Profile {
  final String name;
  final int age;
  final String email;
  final String phoneNumber;
  final String password;
  final Gender? gender;

  const Profile({
    required this.name,
    required this.age,
    this.email = '',
    this.phoneNumber = '',
    this.password = '',
    this.gender,
  });

  Profile copyWith({
    String? name,
    int? age,
    String? email,
    String? phoneNumber,
    String? password,
    Gender? gender,
  }) {
    return Profile(
      name: name ?? this.name,
      age: age ?? this.age,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      gender: gender ?? this.gender,
    );
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    Gender? gender;
    if (map['gender'] != null) {
      switch (map['gender'] as String) {
        case 'male':
          gender = Gender.male;
          break;
        case 'female':
          gender = Gender.female;
          break;
        case 'other':
          gender = Gender.other;
          break;
      }
    }

    return Profile(
      name: map['name'] as String? ?? '',
      age: map['age'] as int? ?? 0,
      email: map['email'] as String? ?? '',
      phoneNumber: map['phoneNumber'] as String? ?? '',
      password: map['password'] as String? ?? '',
      gender: gender,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'gender': gender?.name,
    };
  }
}
