import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'user.dart';


class ReadPage extends StatelessWidget {
  const ReadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read Page'),
      ),
      body: StreamBuilder<List<User>>(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError){
            return const Text('Error');
          }
            else if (snapshot.hasData){
              final users = snapshot.data!;

              return ListView(
                children: users.map(buildUser).toList(),
              );
            }else{
              return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
  Stream<List<User>> readUsers() {
    return FirebaseFirestore.instance
        .collection('users')
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => User.fromJson(doc.data()))
        .toList());
  }

  Widget buildUser(User user) => ListTile(
    leading: CircleAvatar(child: Text('${user.age}'),),
    title: Text(user.name),
    subtitle: Text(user.age.toString()),
  );
}
