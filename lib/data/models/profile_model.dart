import '../../domain/models/profile.dart';

class ProfileModel extends Profile {
  ProfileModel({required String name, required int age})
    : super(name: name, age: age);

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      name: map['name'] as String? ?? '',
      age: map['age'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'age': age};
  }
}
