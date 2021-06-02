import 'package:flutter/material.dart';
import 'package:flutter_virtual_store/screens/home_screen.dart';

import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_virtual_store/screens/login_screen.dart';
// import 'package:flutter_virtual_store/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

import 'models/user_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: const Color.fromARGB(255, 4, 125, 141)),
        home: HomeScreen(),
      ),
    );
  }
}
