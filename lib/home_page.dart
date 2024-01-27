import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tracker/screens/habit_loop.dart';
import 'package:tracker/screens/pomodoro_screen.dart';
import 'package:tracker/screens/profile_screen.dart';
import 'package:tracker/screens/task_screen.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final List<Widget> _screens = [
    Habit_Loop(),
    PomoDoro_Screen(),
    const Task_Screen(),
    const Profile_Screen()
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.amber,
        buttonBackgroundColor: Colors.blue,
        height: 50,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 400),
        items: const <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_task, size: 30),
              Text('Habits'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.loop, size: 30),
              Text('Pomo'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.task, size: 30),
              Text('Tasker'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_sharp, size: 30),
              Text('Profile'),
            ],
          ),
        ],
        index: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
