import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_users/otp.dart';
import 'signup.dart';
import 'consumer.dart';
import 'myhome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          primarySwatch: Colors.deepOrange,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        routes: <String, WidgetBuilder>{
          '/signup': (BuildContext context) => const SignupPage(),
          '/student': (BuildContext context) => const ConsumerPage(),
          '/otp': (BuildContext context) => const OtpScreen(),
          '/main': (BuildContext context) => const MyApp(),
        });
  }
}
