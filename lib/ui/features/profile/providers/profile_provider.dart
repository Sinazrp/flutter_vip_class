import 'package:flutter/material.dart';
import '../../../../domain/models/profile.dart';
import '../../../../data/repositories/user_repository.dart';

enum ProfileState { initial, loading, loaded, error }

class ProfileProvider extends ChangeNotifier {
  final UserRepository _userRepository;

  ProfileProvider(this._userRepository);

  // State
  ProfileState _state = ProfileState.initial;
  Profile? _profile;
  String _errorMessage = '';

  // Getters
  ProfileState get state => _state;
  Profile? get profile => _profile;
  String get errorMessage => _errorMessage;
  bool get isLoading => _state == ProfileState.loading;

  // Load profile
  Future<void> loadProfile() async {
    _state = ProfileState.loading;
    notifyListeners();

    try {
      _profile = await _userRepository.getCurrentProfile();
      _state = ProfileState.loaded;
    } catch (e) {
      _errorMessage = e.toString();
      _state = ProfileState.error;
    }

    notifyListeners();
  }

  // Save profile
  Future<bool> saveProfile(Profile profile) async {
    _state = ProfileState.loading;
    notifyListeners();

    try {
      _profile = await _userRepository.saveProfile(profile);
      _state = ProfileState.loaded;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      _state = ProfileState.error;
      notifyListeners();
      return false;
    }
  }

  // Update profile
  Future<bool> updateProfile({
    String? name,
    int? age,
    String? email,
    String? phoneNumber,
    String? password,
    Gender? gender,
  }) async {
    _state = ProfileState.loading;
    notifyListeners();

    try {
      _profile = await _userRepository.updateProfile(
        name: name,
        age: age,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        gender: gender,
      );
      _state = ProfileState.loaded;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      _state = ProfileState.error;
      notifyListeners();
      return false;
    }
  }

  // Update gender only (for real-time UI update)
  void updateGender(Gender? gender) {
    if (_profile != null) {
      _profile = _profile!.copyWith(gender: gender);
      notifyListeners();  // 👈 Immediately updates UI
    }
  }
}
