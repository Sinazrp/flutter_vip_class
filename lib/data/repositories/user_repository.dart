import '../../domain/models/profile.dart';
import '../services/local_storage_service.dart';

class UserRepository {
  final LocalStorageService _storage;
  static const String _profileKey = 'current_profile';

  UserRepository(this._storage);

  // Get current profile
  Future<Profile?> getCurrentProfile() async {
    try {
      final profileData = _storage.getMap(_profileKey);
      if (profileData != null) {
        return Profile.fromMap(profileData);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to load profile: $e');
    }
  }

  // Save profile
  Future<Profile> saveProfile(Profile profile) async {
    try {
      await _storage.saveMap(_profileKey, profile.toMap());
      return profile;
    } catch (e) {
      throw Exception('Failed to save profile: $e');
    }
  }

  // Update profile
  Future<Profile> updateProfile({
    String? name,
    int? age,
    String? email,
    String? phoneNumber,
    String? password,
    Gender? gender,
  }) async {
    try {
      final currentProfile = await getCurrentProfile();
      if (currentProfile == null) {
        throw Exception('No profile found');
      }

      final updatedProfile = currentProfile.copyWith(
        name: name,
        age: age,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        gender: gender,
      );

      await _storage.saveMap(_profileKey, updatedProfile.toMap());
      return updatedProfile;
    } catch (e) {
      throw Exception('Failed to update profile: $e');
    }
  }
}
