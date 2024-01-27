import 'package:flutter/material.dart';

class Habit_Loop extends StatefulWidget {
  @override
  _Habit_LoopState createState() => _Habit_LoopState();
}

class _Habit_LoopState extends State<Habit_Loop> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> habits = [];
  Map<String, dynamic> currentHabit = {
    'title': '',
    'description': '',
    'completed': false
  };

  void addHabit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        habits.add(Map.from(currentHabit));
      });
      Navigator.of(context).pop();
    }
  }

  void editHabit(int index) {
    currentHabit = habits[index];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Habit'),
          content: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: currentHabit['title'],
                  decoration: const InputDecoration(labelText: 'Habit title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    currentHabit['title'] = value;
                  },
                ),
                TextFormField(
                  initialValue: currentHabit['description'],
                  decoration:
                      const InputDecoration(labelText: 'Habit description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    currentHabit['description'] = value;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  setState(() {
                    habits[index] = Map.from(currentHabit);
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void deleteHabit(int index) {
    setState(() {
      habits.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Habit Tracker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(habits[index]['title']),
            onDismissed: (direction) {
              deleteHabit(index);
            },
            child: ListTile(
              title: Text(habits[index]['title']),
              subtitle: Text(habits[index]['description']),
              trailing: Checkbox(
                value: habits[index]['completed'],
                onChanged: (bool? value) {
                  setState(() {
                    habits[index]['completed'] = value;
                  });
                },
              ),
              onTap: () => editHabit(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          currentHabit = {'title': '', 'description': '', 'completed': false};
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Add Habit'),
                content: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Habit title'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a title';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          currentHabit['title'] = value;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Habit description'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a description';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          currentHabit['description'] = value;
                        },
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Add'),
                    onPressed: addHabit,
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Habit_Loop(),
  ));
}
