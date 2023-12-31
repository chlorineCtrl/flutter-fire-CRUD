import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fire_crud/firebase_options.dart';
import 'package:flutter_fire_crud/user.dart';
import 'user_page.dart';
import 'read_page.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to the UserPage when the button is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserPage()),
                );
              },
              child: const Text('Go to Create Page'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the ReadPage when the button is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReadPage()),
                );
              },
              child: const Text('Go to Read Page'),
            ),
          ],
        ),
      ),
    );
  }

}


