import 'package:flutter/material.dart';

class Profile_Screen extends StatelessWidget {
  const Profile_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                  'https://example.com/avatar.jpg'), // Replace with your image URL
            ),
            title: const Text(
              "SHIVAM SHAKYA",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Flutter Developer",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "Email: shivam@example.com",
                  style: TextStyle(fontSize: 20),
                ), // Replace with your email
                Text(
                  "Location: India",
                  style: TextStyle(fontSize: 20),
                ), // Replace with your location
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
