import 'package:flutter/material.dart';
import 'package:tracker/Login_Screens/SignUp_Page.dart';
import 'package:tracker/Login_Screens/login_page.dart';
import 'package:tracker/Login_Screens/welcome_page.dart';
import 'package:tracker/home_page.dart';
import 'package:tracker/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tracker App',
      initialRoute: '/', // This is the route that the app will start with
      routes: {
        '/': (context) => const SplashScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const Login_Page(),
        '/signup': (context) => const SignUp_Page(),
        '/home': (context) => const Home_Page(),
        
      },
    );
  }
}
