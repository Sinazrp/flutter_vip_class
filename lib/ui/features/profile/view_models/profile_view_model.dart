import 'package:flutter/material.dart';
import 'package:flutter_vip_class/domain/models/profile.dart';
import 'package:flutter_vip_class/ui/core/Routes/app_routes.dart';

class ProfileViewModel {
  Profile _profile = const Profile(name: '', age: 0);

  Profile get profile => _profile;

  void updateName(String newName) {
    _profile = _profile.copyWith(name: newName);
  }

  void updateAge(String ageString) {
    final parsed = int.tryParse(ageString);
    final age = parsed != null && parsed > 0 ? parsed : 0;
    _profile = _profile.copyWith(age: age);
  }

  void updateEmail(String newEmail) {
    _profile = _profile.copyWith(email: newEmail);
  }

  void updatePhoneNumber(String newPhoneNumber) {
    _profile = _profile.copyWith(phoneNumber: newPhoneNumber);
  }

  void updatePassword(String newPassword) {
    _profile = _profile.copyWith(password: newPassword);
  }

  Profile buildProfile() {
    return _profile.copyWith(name: _profile.name.trim());
  }

   void submitProfile(BuildContext context ,GlobalKey<FormState>key ) {
    final form = key.currentState;
    if (form == null || !form.validate()) {
      return;
    }

    form.save();

    Future.delayed(const Duration(milliseconds: 300), () {
      Navigator.pushNamed(
        context,
        AppRoutes.tasks,
        arguments:buildProfile(),
      );
    });
  }
}
