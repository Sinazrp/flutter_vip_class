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

// import 'package:flutter/material.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile Page'),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 8.0),
//             child: Icon(Icons.account_circle),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(right: 8, left: 30),
//             child: Icon(Icons.delete),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,

//             //crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(height: 20),
//               Text(
//                 'Please enter your profile information first.',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w700,
//                   color: Colors.red,
//                 ),
//               ),
//               SizedBox(height: 40),
//               Container(
//                 height: 1500,
//                 width: double.infinity,

//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: Colors.grey[300],
//                 ),
//               ),
//               Text(
//                 'This is a placeholder for the profile form. You can replace this with your actual form fields.',
//                 style: TextStyle(fontSize: 14, color: Colors.black54),
//               ),
//               SizedBox(height: 50),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
