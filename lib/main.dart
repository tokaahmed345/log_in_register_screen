import 'package:flutter/material.dart';
import 'package:logpage/screens/body.dart';
import 'package:logpage/screens/login.dart';
import 'package:logpage/screens/register.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,

      ),
    routes: {LogIn.id:(context)=>const LogIn(),
    
    Register.id:(context)=>const Register(),
        Main.id:(context)=>const Main(),

    },
 initialRoute: LogIn.id,
 
    );
  }
}
