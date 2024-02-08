import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Session {
  final DateTime startTime;
  final DateTime endTime;
  final String description;

  Session(
      {required this.startTime,
      required this.endTime,
      required this.description});
}

class SessionHistory extends ChangeNotifier {
  final List<Session> _sessions = [];

  List<Session> get sessions => _sessions;

  void addSession(Session session) {
    _sessions.add(session);
    notifyListeners();
  }
}

class NewSessionScreen extends StatelessWidget {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Session'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _timeController,
              decoration: const InputDecoration(labelText: 'Time (minutes)'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              child: const Text('Start'),
              onPressed: () {
                Navigator.of(context).pop({
                  'description': _descriptionController.text,
                  'time': int.parse(_timeController.text),
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PomoDoro_Screen extends StatefulWidget {
  @override
  _PomoDoro_ScreenState createState() => _PomoDoro_ScreenState();
}

class _PomoDoro_ScreenState extends State<PomoDoro_Screen> {
  Timer? _timer;
  int _timeRemaining = 25 * 60; // Default Pomodoro time
  bool _isRunning = false;
  String _description = '';

  void _startOrPause() {
    if (_description.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in the description.')),
      );
      return;
    }

    setState(() {
      if (_isRunning) {
        _timer?.cancel();
      } else {
        _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          setState(() {
            if (_timeRemaining > 0) {
              _timeRemaining--;
            } else {
              _timer?.cancel();
            }
          });
        });
      }
      _isRunning = !_isRunning;
    });
  }

  @override
  Widget build(BuildContext context) {
    int minutes = _timeRemaining ~/ 60;
    int seconds = _timeRemaining % 60;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pomodoro Timer',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text(
                'Description',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () async {
                final result = await showDialog<String>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Center(child: Text('Set Description')),
                    content: TextField(
                      onSubmitted: (value) => Navigator.of(context).pop(value),
                    ),
                  ),
                );
                if (result != null) {
                  setState(() {
                    _description = result;
                  });
                }
              },
            ),
            Text(
              _description,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 60),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text(
                'Custom',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () async {
                final result = await showDialog<int>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Center(child: Text('Set Time')),
                    content: TextField(
                      keyboardType: TextInputType.number,
                      onSubmitted: (value) =>
                          Navigator.of(context).pop(int.parse(value)),
                    ),
                  ),
                );
                if (result != null) {
                  setState(() {
                    _timeRemaining = result * 60;
                  });
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startOrPause,
        child: Icon(_isRunning ? Icons.pause : Icons.play_arrow),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SessionHistory()),
      ],
      child: MaterialApp(
        home: PomoDoro_Screen(),
      ),
    ),
  );
}
