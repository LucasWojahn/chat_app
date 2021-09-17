import 'package:chat_app/chat_screen.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/stores/login_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  // FirebaseFirestore.instance.collection('users').doc("teste").set({"inserir":"data"});
  // FirebaseFirestore.instance.collection("users").snapshots().listen((event) {
  //   event.docs.forEach((element) {
  //     print(element.data());
  //   });
  // });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<LoginStore>(
      create: (_) => LoginStore(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          iconTheme: IconThemeData(
              color: Colors.black
          ),
          // scaffoldBackgroundColor: Colors.deepPurpleAccent,
        ),
        home: LoginScreen(),
      ),
    );
  }
}

