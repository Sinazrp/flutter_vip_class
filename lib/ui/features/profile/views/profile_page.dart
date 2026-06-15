import 'package:flutter/material.dart';
import 'package:flutter_vip_class/ui/core/validators/form_validators.dart';
import 'package:flutter_vip_class/ui/features/profile/view_models/profile_view_model.dart';
import '../../../core/theme/app_text_styles.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _viewModel = ProfileViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Setup')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          // addAutomaticKeepAlives: true,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.amber),
              margin: EdgeInsets.all(10),
              child: Center(child: Text("data")),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.amber),
              margin: EdgeInsets.all(10),
              child: Center(child: Text("data")),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.amber),
              margin: EdgeInsets.all(10),
              child: Center(child: Text("data")),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.amber),
              margin: EdgeInsets.all(10),
              child: Center(child: Text("data")),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.amber),
              margin: EdgeInsets.all(10),
              child: Center(child: Text("data")),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.amber),
              margin: EdgeInsets.all(10),
              child: Center(child: Text("data")),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.amber),
              margin: EdgeInsets.all(10),
              child: Center(child: Text("data")),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.amber),
              margin: EdgeInsets.all(10),
              child: Center(child: Text("data")),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.amber),
              margin: EdgeInsets.all(10),
              child: Center(child: Text("data")),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.amber),
              margin: EdgeInsets.all(10),
              child: Center(child: Text("data")),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.amber),
              margin: EdgeInsets.all(10),
              child: Center(child: Text("data")),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.amber),
              margin: EdgeInsets.all(10),
              child: Center(child: Text("data")),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.amber),
              margin: EdgeInsets.all(10),
              child: Center(child: Text("data")),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.amber),
              margin: EdgeInsets.all(10),
              child: Center(child: Text("data 10")),
            ),
          ],
        ),
      ),
    );
  }
}
