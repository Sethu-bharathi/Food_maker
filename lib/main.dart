import 'package:flutter/material.dart';
import 'package:notes_app/Menu.dart';
import 'package:notes_app/Profile_Screen/Profile_Screen.dart';
import 'package:notes_app/Signupscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notes_app/Addmenu.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Addmenu(),
      routes: {
        Addmenu.id:(context)=>Addmenu(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NotesMaker"),
      ),
    );
  }
}
