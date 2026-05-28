import 'package:flutter_vip_class/domain/models/profile.dart';

class ProfileViewModel {
  String name = '';
  int age = 0;
  String email = '';
  String phoneNumber = '';
  String password = '';



  void updateName(String newName) {
    name = newName;
  }

  void updateAge(String ageString) {
    final parsed = int.tryParse(ageString);
    age = parsed != null && parsed > 0 ? parsed : 0;
  }

  void updateEmail(String newEmail) {
    email = newEmail;
  }

  void updatePhoneNumber(String newPhoneNumber) {
    phoneNumber = newPhoneNumber;
  }

  void updatePassword(String newPassword) {
    password = newPassword;
  }

  Profile buildProfile() {
    return Profile(name: name.trim(), age: age);
  }
}
