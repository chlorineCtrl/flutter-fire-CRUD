import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          TextField(
            controller: controllerName,
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
          ),
           TextField(
             controller: controllerAge,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Age',
            ),
          ),
          ElevatedButton(onPressed: () {
            final user = User(
              name: controllerName.text,
              age: int.parse(controllerAge.text),
            );
            createUser(user);
          } , child: const Text('submit'),)


        ],
      ),
    );
  }

  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    user.id = docUser.id;

    final json = user.toJson();
    await docUser.set(json);
  }
}

class User {
  String id;
  final String name;
  final int age;

  User({
    this.id = '',
    required this.name,
    required this.age
});

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'age': age,
  };
}
