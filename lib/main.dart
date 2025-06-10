import 'package:flutter/material.dart';
import 'package:myapp/notes.dart'; 
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyC8-pfa5RVfgiGX8FqBP1EvJcpH1LiLnTQ",
      appId: "1:643178240134:android:7689df4402c8ec24e05907",
      messagingSenderId: "643178240134",
      projectId: "notesapp-198b5")
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: NotesScreen()); // Usando NotesScreen
  }
}
