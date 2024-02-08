import 'package:flutter/material.dart';
import 'package:tracker/Login_Screens/SignUp_Page.dart';
import 'package:tracker/Login_Screens/login_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF43CBFF),
          Color(0xFF9708CC),
        ])),
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.2),
              child: Image(
                  image: AssetImage('assets/images/.png'),
                  height: screenHeight * 0.2),
            ),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            const Text(
              'Welcome Back',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Login_Page()));
              },
              child: Container(
                height: screenHeight * 0.07,
                width: screenWidth * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white),
                ),
                child: const Center(
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUp_Page()));
              },
              child: Container(
                height: screenHeight * 0.07,
                width: screenWidth * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white),
                ),
                child: const Center(
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.1, // replace Spacer with SizedBox
            ),
            const Text(
              'Login with Social Media',
              style: TextStyle(fontSize: 17, color: Colors.white),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Image(
                image: AssetImage('assets/images/social.png'),
                height: screenHeight * 0.2),
            SizedBox(
              height: screenHeight * 0.01,
            ),
          ]),
        ),
      ),
    );
  }
}