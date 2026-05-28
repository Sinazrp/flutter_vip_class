import 'package:flutter_vip_class/domain/models/profile.dart';

class ProfileViewModel {
  String name = '';
  int age = 0;

  bool get isValid => name.trim().isNotEmpty && age > 0;

  void updateName(String newName) {
    name = newName;
  }

  void updateAge(String ageString) {
    final parsed = int.tryParse(ageString);
    age = parsed != null && parsed > 0 ? parsed : 0;
  }

  Profile buildProfile() {
    return Profile(name: name.trim(), age: age);
  }
}
