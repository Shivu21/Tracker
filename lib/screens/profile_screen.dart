
import 'package:flutter/material.dart';

class Profile_Screen extends StatelessWidget {
  const Profile_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('https://example.com/avatar.jpg'), // Replace with your image URL
            ),
            title: const Text(
              "SHIVAM SHAKYA",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Flutter Developer"),
                Text("Email: shivam@example.com"), // Replace with your email
                Text("Location: India"), // Replace with your location
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Navigate to edit profile screen
              },
            ),
          ),
          // Add more ListTiles for other profile details
        ],
      ),
    );
  }
}