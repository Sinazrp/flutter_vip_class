import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_vip_class/ui/core/validators/form_validators.dart';
import 'package:flutter_vip_class/ui/core/Routes/app_routes.dart';
import 'package:flutter_vip_class/domain/models/profile.dart';
import 'package:flutter_vip_class/ui/features/profile/providers/profile_provider.dart';
import '../../../core/theme/app_text_styles.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load profile data on init
    Future.microtask(() {
      if (mounted) {
        context.read<ProfileProvider>().loadProfile();
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _populateFields(Profile? profile) {
    if (profile != null) {
      _nameController.text = profile.name;
      _ageController.text = profile.age.toString();
      _emailController.text = profile.email;
      _phoneController.text = profile.phoneNumber;
      _passwordController.text = profile.password;
    }
  }

  void _submitProfile() async {
    final form = _formKey.currentState;
    if (form == null || !form.validate()) return;

    form.save();

    final provider = context.read<ProfileProvider>();
    final name = _nameController.text.trim();
    final age = int.tryParse(_ageController.text.trim()) ?? 0;
    final email = _emailController.text.trim();
    final phone = _phoneController.text.trim();
    final password = _passwordController.text.trim();
    final gender = provider.profile?.gender;  // 👈 Get gender from provider

    // Check if profile exists - save new or update existing
    bool success;
    if (provider.profile == null) {
      success = await provider.saveProfile(
        Profile(
          name: name,
          age: age,
          email: email,
          phoneNumber: phone,
          password: password,
          gender: gender,
        ),
      );
    } else {
      success = await provider.updateProfile(
        name: name,
        age: age,
        email: email,
        phoneNumber: phone,
        password: password,
        gender: gender,
      );
    }

    if (success && mounted) {
      Navigator.pushNamed(
        context,
        AppRoutes.tasks,
        arguments: provider.profile,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Setup')),
      body: Consumer<ProfileProvider>(
        builder: (context, provider, child) {
          // Populate fields when profile is loaded
          if (provider.state == ProfileState.loaded && provider.profile != null) {
            _populateFields(provider.profile);
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Enter your profile information first.',
                      style: AppTextStyles.headlineMedium,
                    ),
                    const SizedBox(height: 24),

                    // Show loading indicator
                    if (provider.isLoading)
                      const LinearProgressIndicator(),

                    const SizedBox(height: 16),

                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: FormValidators.validateName,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _ageController,
                      decoration: const InputDecoration(
                        labelText: 'Age',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: FormValidators.validateAge,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: FormValidators.validateEmail,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: FormValidators.validatePhoneNumber,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: FormValidators.validatePassword,
                    ),
                    const SizedBox(height: 24),

                    // 👇 Gender Selector - Real-time UI update with Provider
                    const Text(
                      'Gender',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildGenderOption(
                          context,
                          icon: Icons.male,
                          label: 'Male',
                          gender: Gender.male,
                          provider: provider,
                        ),
                        _buildGenderOption(
                          context,
                          icon: Icons.female,
                          label: 'Female',
                          gender: Gender.female,
                          provider: provider,
                        ),
                        _buildGenderOption(
                          context,
                          icon: Icons.transgender,
                          label: 'Other',
                          gender: Gender.other,
                          provider: provider,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: provider.isLoading ? null : _submitProfile,
                      child: const Text('Continue to Tasks'),
                    ),

                    // Show error message
                    if (provider.state == ProfileState.error)
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          provider.errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // 👇 Build gender option widget - demonstrates real-time UI update
  Widget _buildGenderOption(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Gender gender,
    required ProfileProvider provider,
  }) {
    final isSelected = provider.profile?.gender == gender;
    final color = isSelected ? Colors.green : Colors.grey;

    return GestureDetector(
      onTap: () {
        // 👇 This calls Provider which calls notifyListeners()
        // 👇 Consumer rebuilds immediately - UI updates in real-time!
        provider.updateGender(gender);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected ? Colors.green.shade50 : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? Colors.green : Colors.grey.shade300,
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Icon(
              icon,
              size: 40,
              color: color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
