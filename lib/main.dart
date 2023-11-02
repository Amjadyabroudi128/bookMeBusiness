import 'package:bookmebusiness/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

 Future <void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: FirebaseOptions(
         apiKey: "AIzaSyCg8zJdXr-AAWQ18oTUSJEu1wDXs9jdnbY",
         appId: "bookme-ef465",
         messagingSenderId:
         "213012481780",
         projectId: "bookme-ef465")
   );
  runApp(const MyScreen());
}

class MyScreen extends StatelessWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}



