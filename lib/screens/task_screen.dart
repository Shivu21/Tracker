import 'package:flutter/material.dart';

class Task_Screen extends StatefulWidget {
  const Task_Screen({Key? key}) : super(key: key);

  @override
  _Task_ScreenState createState() => _Task_ScreenState();
}

class _Task_ScreenState extends State<Task_Screen> {
  List<String> pendingTasks = [
    'Task 1',
    'Task 2',
    'Task 3',
    // Add more pending tasks as needed
  ];

  List<String> completedTasks = [
    'Completed Task 1',
    'Completed Task 2',
    // Add more completed tasks as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task Manager',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: pendingTasks.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(pendingTasks[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.check),
                      onPressed: () {
                        setState(() {
                          completedTasks.add(pendingTasks.removeAt(index));
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: completedTasks.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(completedTasks[index]),
                    leading: const Icon(Icons.done, color: Colors.green),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Navigate to new task screen
        },
      ),
    );
  }
}
