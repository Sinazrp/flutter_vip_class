import 'package:flutter/material.dart';
import 'package:flutter_vip_class/domain/models/profile.dart';
import 'package:flutter_vip_class/ui/core/Routes/app_routes.dart';

class ProfileViewModel {
<<<<<<< HEAD:lib/ui/features/profile/view_models/profile_view_model.dart
  Profile _profile = const Profile(name: '', age: 0);

  Profile get profile => _profile;
=======
  String name = '';
  int age = 0;
  String email = '';
  String phoneNumber = '';
  String password = '';
>>>>>>> 28820f424d9e1491430498071fce6a6d98b27bf6:lib/ui/features/sign_in/view_models/sign_in_view_model.dart

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
<<<<<<< HEAD:lib/ui/features/profile/view_models/profile_view_model.dart
    return _profile.copyWith(name: _profile.name.trim());
  }

  void submitProfile(BuildContext context, GlobalKey<FormState> key) {
    final formState = key.currentState;
    if (formState == null || !formState.validate()) {
      return;
    }

    formState.save();

    Navigator.pushNamed(context, AppRoutes.tasks, arguments: buildProfile());
=======
    return Profile(
      name: name.trim(),
      age: age,
      email: email,
      phoneNumber: phoneNumber,
    );
>>>>>>> 28820f424d9e1491430498071fce6a6d98b27bf6:lib/ui/features/sign_in/view_models/sign_in_view_model.dart
  }
}
