import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_vip_class/ui/core/validators/form_validators.dart';
import 'package:flutter_vip_class/ui/features/profile/view_models/profile_view_model.dart';
import 'package:flutter_vip_class/ui/features/simplepage.dart';
import '../../../core/theme/app_text_styles.dart';
=======
>>>>>>> 28820f424d9e1491430498071fce6a6d98b27bf6

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  String insertPhoneNumber(number) {
    final String num = number.toString();
    String middle = "";

<<<<<<< HEAD
class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _viewModel = ProfileViewModel();

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
=======
    for (int i = 0; i < num.length - 3; i++) {
      middle += "*";
    }
    return number.replaceRange(2, num.length - 2, middle);
  }

  @override
  Widget build(BuildContext context) {
    final profile =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
>>>>>>> 28820f424d9e1491430498071fce6a6d98b27bf6

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(title: const Text("Profile")),

      body: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.lightGreen, width: 3)),
          color: const Color.fromARGB(255, 237, 237, 237),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 150),
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(Icons.person, size: 130),
              ),
              Expanded(
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: Container(
                        decoration: BoxDecoration(
                          border: const Border(bottom: BorderSide(width: 1.0)),
                        ),
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          children: [
                            Text(
                              "${profile.keys.elementAt(index)}: ",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight(600),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                profile.values.elementAt(index),
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 95, 95, 95),
                                  fontSize: 20,
                                  fontWeight: FontWeight(600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 15);
                  },
                  itemCount: profile.length,
                ),
<<<<<<< HEAD
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
                  onPressed: () {
                    _viewModel.submitProfile(context, _formKey);
                  },
                  child: const Text('Continue to Tasks'),
                ),
                const SizedBox(height: 20),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => const Simplepage(),
                //       ),
                //     );
                //   },

                //   child: const Text('go to simple page'),
                // ),
              ],
            ),
=======
              ),
            ],
>>>>>>> 28820f424d9e1491430498071fce6a6d98b27bf6
          ),
        ),
      ),
    );
  }
}
