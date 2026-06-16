import '../../domain/models/profile.dart';

class ProfileModel extends Profile {
  ProfileModel({
    required super.name,
    required super.age,
    required super.email,
    required super.phoneNumber,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      name: map['name'] as String? ?? '',
      age: map['age'] as int? ?? 0,
      email: map['email'] as String? ?? '',
      phoneNumber: map['phoneNumber'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'age': age};
  }
}
