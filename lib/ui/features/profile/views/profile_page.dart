import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  String insertPhoneNumber(number) {
    final String num = number.toString();
    String middle = "";

    for (int i = 0; i < num.length - 3; i++) {
      middle += "*";
    }
    return number.replaceRange(2, num.length - 2, middle);
  }

  @override
  Widget build(BuildContext context) {
    final profile =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
