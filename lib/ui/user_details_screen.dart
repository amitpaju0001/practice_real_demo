import 'package:flutter/material.dart';
import 'package:practice_real_demo/model/user_model.dart';

class UserDetailsScreen extends StatelessWidget {
  final UserModel user;

  const UserDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${user.userId}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('Name: ${user.name}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('Age: ${user.age}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('Address: ${user.address}', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
