import 'package:flutter/material.dart';
import 'package:flutter_vip_class/ui/features/profile/view_models/profile_view_model.dart';
import '../../../core/Routes/app_routes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _viewModel = ProfileViewModel();

  void _submitProfile() {
    final form = _formKey.currentState;
    if (form == null || !form.validate()) {
      return;
    }

    form.save();

    if (_viewModel.isValid) {
      Navigator.pushNamed(
        context,
        AppRoutes.tasks,
        arguments: _viewModel.buildProfile(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Setup')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Enter your profile information first.',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 24),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your name.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _viewModel.updateName(value ?? '');
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your age.';
                  }
                  final age = int.tryParse(value);
                  if (age == null || age <= 0) {
                    return 'Please enter a valid age.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _viewModel.updateAge(value ?? '');
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitProfile,
                child: const Text('Continue to Tasks'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
