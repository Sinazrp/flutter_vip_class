import 'package:flutter/material.dart';
import 'package:flutter_vip_class/ui/core/validators/form_validators.dart';
import 'package:flutter_vip_class/ui/core/widgets/custom_button.dart';
import 'package:flutter_vip_class/ui/features/profile/view_models/profile_view_model.dart';
import '../../../core/Routes/app_routes.dart';
import '../../../core/theme/app_text_styles.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _viewModel = ProfileViewModel();

  void submitProfile() {
    final form = _formKey.currentState;
    if (form == null || !form.validate()) {
      return;
    }

    form.save();

    Future.delayed(const Duration(milliseconds: 300), () {
      Navigator.pushNamed(
        context,
        AppRoutes.tasks,
        arguments: _viewModel.buildProfile(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Setup')),
      body: Padding(
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
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: FormValidators.validateName,
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
                  validator: FormValidators.validateAge,

                  onSaved: (value) {
                    _viewModel.updateAge(value ?? '');
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: FormValidators.validateEmail,
                  onSaved: (value) {
                    _viewModel.updateEmail(value ?? '');
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: FormValidators.validatePhoneNumber,
                  onSaved: (value) {
                    _viewModel.updatePhoneNumber(value ?? '');
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: FormValidators.validatePassword,
                  onSaved: (value) {
                    _viewModel.updatePassword(value ?? '');
                  },
                ),
                const SizedBox(height: 24),

                // Added two more widgets
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Birth YYYY/MM/DD",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.datetime,
                  validator: FormValidators.validateDate,
                ),

                const SizedBox(height: 24),

                TextFormField(
                  decoration: InputDecoration(
                    labelText: "National code",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: FormValidators.validateNationalCode,
                ),

                const SizedBox(height: 24),
                //CustomButton(submitProfile: submitProfile),
                ElevatedButton(
                  onPressed: submitProfile,
                  child: const Text('Continue to Tasks'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
